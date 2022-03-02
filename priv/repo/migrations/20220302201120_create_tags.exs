defmodule Logbook.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :citext, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:tags, [:user_id])
    # tags_user_id_name_index
    create unique_index(:tags, [:user_id, :name])
  end
end
