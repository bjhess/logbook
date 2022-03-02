defmodule Logbook.Book do
  @moduledoc """
  The Book context.
  """

  import Ecto.Query, warn: false
  alias Logbook.Repo

  alias Logbook.Accounts.User
  alias Logbook.Book.Log
  alias Logbook.Book.Category

  def list_categories do
    Repo.all(Category)
  end

  def get_category!(id), do: Repo.get!(Category, id)

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def create_default_category!(%User{} = user, attrs \\ %{}) do
    user
    |> Map.merge(%{name: "Default"}, attrs)
    |> create_category()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end


  def list_logs do
    Repo.all(Log)
  end

  def get_log!(id), do: Repo.get!(Log, id)

  def create_log(attrs \\ %{}) do
    %Log{}
    |> Log.changeset(attrs)
    |> Repo.insert()
  end

  def update_log(%Log{} = log, attrs) do
    log
    |> Log.changeset(attrs)
    |> Repo.update()
  end

  def delete_log(%Log{} = log) do
    Repo.delete(log)
  end

  def change_log(%Log{} = log, attrs \\ %{}) do
    Log.changeset(log, attrs)
  end

end
