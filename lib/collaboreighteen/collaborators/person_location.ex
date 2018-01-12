defmodule Collaboreighteen.Collaborators.PersonLocation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collaboreighteen.Collaborators.PersonLocation


  schema "people_locations" do
    field :person_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(%PersonLocation{} = person_location, attrs) do
    person_location
    |> cast(attrs, [])
    |> validate_required([])
  end
end
