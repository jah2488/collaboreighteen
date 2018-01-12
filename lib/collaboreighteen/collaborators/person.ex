defmodule Collaboreighteen.Collaborators.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collaboreighteen.Collaborators.Person
  alias Collaboreighteen.Collaborators.PersonSkill
  alias Collaboreighteen.Collaborators.Location
  alias Collaboreighteen.Offerings.Skill

  schema "people" do
    field(:name, :string)
    field(:email, :string)
    field(:edit_token, :string)
    has_many(:people_skills, PersonSkill)
    many_to_many(:skills, Skill, join_through: "people_skills")
    many_to_many(:locations, Location, join_through: "people_locations")

    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [:name, :email])
    |> validate_required([:name])
  end
end
