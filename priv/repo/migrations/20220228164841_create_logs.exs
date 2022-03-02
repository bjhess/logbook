defmodule Logbook.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:logs, [:user_id])
  end
end
