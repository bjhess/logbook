defmodule Logbook.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :username, :string
      add :body, :string

      timestamps()
    end
  end
end
