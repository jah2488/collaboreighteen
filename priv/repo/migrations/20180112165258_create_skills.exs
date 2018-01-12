defmodule Collaboreighteen.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string

      timestamps()
    end

    create unique_index(:skills, [:name])
  end
end
