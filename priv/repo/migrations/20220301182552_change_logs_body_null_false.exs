defmodule Logbook.Repo.Migrations.ChangeLogsBodyNullFalse do
  use Ecto.Migration

  def up do
    alter table("logs") do
      modify :body, :string, null: false
    end
  end

  def down do
    alter table("logs") do
      modify :body, :string, null: true
    end
  end
end
