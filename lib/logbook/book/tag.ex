defmodule Logbook.Book.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string

    belongs_to :user, Logbook.Accounts.User
    has_many :taggings, Logbook.Book.Tagging
    has_many :logs, through: [:taggings, :log]

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:user_id, :name])
  end
end
