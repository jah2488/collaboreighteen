defmodule Collaboreighteen.Collaborators.PersonSkill do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collaboreighteen.Collaborators.PersonSkill
  alias Collaboreighteen.Collaborators.Person
  alias Collaboreighteen.Offerings.Skill

  schema "people_skills" do
    field(:notes, :string)
    field(:paid, :boolean, default: false)
    field(:payment_notes, :string)

    belongs_to(:person, Person)
    belongs_to(:skill, Skill)

    timestamps()
  end

  @doc false
  def changeset(%PersonSkill{} = person_skill, attrs) do
    person_skill
    |> cast(attrs, [:notes, :paid, :payment_notes])
    |> validate_required([:notes, :paid, :payment_notes])
  end
end
