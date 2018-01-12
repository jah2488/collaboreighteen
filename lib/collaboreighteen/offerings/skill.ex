defmodule Collaboreighteen.Offerings.Skill do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collaboreighteen.Collaborators.Person
  alias Collaboreighteen.Offerings.Skill

  schema "skills" do
    field(:name, :string)

    many_to_many(:people, Person, join_through: "people_skills")

    timestamps()
  end

  @doc false
  def changeset(%Skill{} = skill, attrs) do
    skill
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
