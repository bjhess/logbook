defmodule Logbook.Repo.Migrations.ChangeLogsBodyNullFalse do
  use Ecto.Migration

  def change do
    alter table("logs") do
      modify :body, :string, null: false
    end
  end
end
