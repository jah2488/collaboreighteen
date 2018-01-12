defmodule Collaboreighteen.Repo.Migrations.CreatePeopleSkills do
  use Ecto.Migration

  def change do
    create table(:people_skills) do
      add(:notes, :text)
      add(:paid, :boolean, default: false, null: false)
      add(:payment_notes, :text)
      add(:person_id, references(:people, on_delete: :nothing))
      add(:skill_id, references(:skills, on_delete: :nothing))

      timestamps()
    end

    create(index(:people_skills, [:person_id]))
    create(index(:people_skills, [:skill_id]))
  end
end
