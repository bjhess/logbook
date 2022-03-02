defmodule Logbook.Repo.Migrations.CreateTaggings do
  use Ecto.Migration

  def change do
    create table(:taggings) do
      add :log_id, references(:logs, on_delete: :delete_all), null: false
      add :tag_id, references(:tags, on_delete: :delete_all), null: false
    end

    create index(:taggings, [:log_id])
    create index(:taggings, [:tag_id])
    create unique_index(:taggings, [:log_id, :tag_id])
  end
end
