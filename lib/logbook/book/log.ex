defmodule Logbook.Book.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :body, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
