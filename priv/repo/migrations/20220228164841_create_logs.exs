defmodule Logbook.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    # Need to drop due to previous creation before I rebuilt the app
    drop_if_exists table(:logs)

    create table(:logs) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:logs, [:user_id])
  end
end
