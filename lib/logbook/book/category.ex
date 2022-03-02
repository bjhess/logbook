defmodule Logbook.Book.Category do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :notes, :string

    belongs_to :user, Logbook.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :notes])
    |> validate_required([:name])
    |> unique_constraint([:name, :user_id])
  end

  def alphabetical(query) do
    from c in query, order_by: c.name
  end

end
