defmodule Logbook.Book.Log do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "logs" do
    field :body, :string

    belongs_to :user, Logbook.Accounts.User
    has_many :taggings, Logbook.Book.Tagging
    has_many :tags, through: [:taggings, :tag]

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end


  def reverse_chronological(query) do
    from l in query, order_by: [desc: l.inserted_at]
  end

end
