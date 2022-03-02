defmodule Logbook.Book.Tagging do
  use Ecto.Schema
  import Ecto.Changeset

  schema "taggings" do
    belongs_to :log, Logbook.Book.Log
    belongs_to :tag, Logbook.Book.Tag
  end

  @doc false
  def changeset(tagging, attrs) do
    tagging
    |> cast(attrs, [])
    |> unique_constraint([:log_id, :tag_id])
    |> cast_assoc(:tag)
  end
end
