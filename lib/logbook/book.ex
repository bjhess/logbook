defmodule Logbook.Book do
  @moduledoc """
  The Book context.
  """

  import Ecto.Query, warn: false
  alias Logbook.Repo

  alias Logbook.Book.Log
  alias Logbook.Book.Tag
  alias Logbook.Book.Tagging
  alias Logbook.Accounts


  def list_tags do
    Repo.all(Tag)
  end

  def tag_log(log, %{tag: tag_attrs} = attrs) do
    tag = create_or_find_tag(tag_attrs)

    log
    |> Ecto.build_assoc(:taggings)
    |> Tagging.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:tag, tag)
    |> Repo.insert()
  end

  defp create_or_find_tag(%{name: "" <> name} = attrs) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, tag} -> tag
      _ -> Repo.get_by(Tag, name: name)
    end
  end
  defp create_or_find_tag(_), do: nil

  def delete_tag_from_log(log, tag) do
    Repo.get_by(Tagging, log_id: log.id, tag_id: tag.id)
    |> case do
      %Tagging{} = tagging -> Repo.delete(tagging)
      nil -> {:ok, %Tagging{}}
    end
  end

  def list_logs do
    Repo.all(Log)
  end

  def get_log!(id), do: Repo.get!(Log, id)

  def create_log(%Accounts.User{} = user, attrs \\ %{}) do
    %Log{}
    |> Log.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
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

  def list_user_logs(%Accounts.User{} = user) do
    Log
    |> user_logs_query(user)
    |> Repo.all()
  end

  def get_user_log!(%Accounts.User{} = user, id) do
    Log
    |> user_logs_query(user)
    |> Repo.get!(id)
  end

  defp user_logs_query(query, %Accounts.User{id: user_id}) do
    from(l in query, where: l.user_id == ^user_id)
  end

end
