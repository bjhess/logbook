defmodule Logbook.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", "DROP EXTENSION citext"

    create table(:categories) do
      add :name, :citext, null: false
      add :notes, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:categories, [:user_id])
    # categories_name_user_id_index
    create unique_index(:categories, [:name, :user_id])
  end
end
