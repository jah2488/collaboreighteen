defmodule Collaboreighteen.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :city, :string
      add :state, :string
      add :country, :string

      timestamps()
    end

  end
end
