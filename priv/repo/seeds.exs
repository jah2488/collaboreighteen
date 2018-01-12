# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Collaboreighteen.Repo.insert!(%Collaboreighteen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

require CSV
require IEx

alias Collaboreighteen.Repo
alias Collaboreighteen.Offerings.Skill
alias Collaboreighteen.Collaborators.Person
alias Collaboreighteen.Collaborators.Location
alias Collaboreighteen.Collaborators.PersonLocation
alias Collaboreighteen.Collaborators.PersonSkill

defmodule Parser do
  def structure_row({:ok, row}) do
    %{
      name: Enum.at(row, 0),
      skills: String.split(Enum.at(row, 1), " "),
      email: Enum.at(row, 2),
      location: String.downcase(Enum.at(row, 3)),
      notes: Enum.at(row, 4)
    }
  end

  def save_record(row) do
    if row.email == "" && row.name == "" && row.location == "" do
      IO.inspect("--- blank row ---")
    else
      emails = Repo.all(Person) |> Enum.map(fn p -> p.email end)

      {:ok, person} =
        if Enum.member?(emails, row.email) do
          IO.inspect("You again?? #{row.email}")
          {:ok, Repo.get_by(Person, email: row.email)}
        else
          Repo.insert(%Person{name: row.name, email: row.email})
        end

      {:ok, location} = Repo.insert(%Location{name: row.location})

      {:ok, _person_location} =
        Repo.insert(%PersonLocation{person_id: person.id, location_id: location.id})

      skills =
        Enum.map(row.skills, fn skill_name ->
          skills = Repo.all(Skill) |> Enum.map(fn sk -> sk.name end)

          skill_name = String.replace(skill_name, ~r/[^a-zA-Z\d\s:]/, "")
          included? = Enum.member?(skills, skill_name)

          too_similar? =
            Enum.any?(skills, fn skill -> String.jaro_distance(skill, skill_name) > 0.95 end)

          cond do
            included? ->
              IO.inspect('Dup found!')
              IO.inspect("Skill: '#{skill_name}'")
              nil

            too_similar? ->
              IO.inspect('Oh thats too close!')
              IO.inspect("Skill: '#{skill_name}'")
              nil

            true ->
              {:ok, skill} = Repo.insert(%Skill{name: skill_name})
              skill
          end
        end)

      skills
      |> Enum.reject(fn skill -> is_nil(skill) end)
      |> Enum.map(fn skill ->
        {notes, payment_notes} = String.split_at(row.notes, 250)

        {:ok, _people_skill} =
          Repo.insert(%PersonSkill{
            person_id: person.id,
            skill_id: skill.id,
            paid: false,
            notes: notes,
            payment_notes: "...#{payment_notes}"
          })
      end)
    end
  end
end

IO.inspect("--- Loading Data from CSV ---")

"priv/repo/data/collaboreighteen-skills-list.csv"
|> File.stream!()
|> CSV.decode()
|> Enum.map(&Parser.structure_row(&1))
|> Enum.map(&Parser.save_record(&1))

IO.inspect("--- done. ---")
