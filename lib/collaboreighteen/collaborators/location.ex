defmodule Collaboreighteen.Collaborators.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collaboreighteen.Collaborators.Location


  schema "locations" do
    field :city, :string
    field :country, :string
    field :name, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:name, :city, :state, :country])
    |> validate_required([:name, :city, :state, :country])
  end
end
