defmodule Collaboreighteen.Repo.Migrations.CreatePeopleLocations do
  use Ecto.Migration

  def change do
    create table(:people_locations) do
      add(:person_id, references(:people, on_delete: :nothing))
      add(:location_id, references(:locations, on_delete: :nothing))

      timestamps()
    end

    create(index(:people_locations, [:person_id]))
    create(index(:people_locations, [:location_id]))
  end
end
