defmodule Collaboreighteen.Repo.Migrations.AddLocationAndContactInfoToPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add(:email, :string)
      add(:edit_token, :string)
    end

    create(unique_index(:people, [:email]))
  end
end
