defmodule Logbook.Book.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :body, :string
    field :username, :string, default: "bjhess"

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:username, :body])
    |> validate_required([:body])
    |> validate_length(:body, min: 2)
  end
end
