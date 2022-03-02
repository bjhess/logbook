defmodule Logbook.Repo.Migrations.CreateTaggings do
  use Ecto.Migration

  def change do
    create table(:taggings, primary_key: false) do
      add :log_id, references(:logs, on_delete: :delete_all), primary_key: true
      add :tag_id, references(:tags, on_delete: :delete_all), primary_key: true
    end

    create index(:taggings, [:log_id])
    create index(:taggings, [:tag_id])
    # I don't think a unique index needs created for the two id fields because
    # them being primary keys probably assures uniqueness.
  end
end
