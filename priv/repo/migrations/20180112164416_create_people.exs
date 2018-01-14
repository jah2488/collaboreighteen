defmodule Collaboreighteen.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add(:name, :string)
      add(:notes, :text)

      timestamps()
    end
  end
end
