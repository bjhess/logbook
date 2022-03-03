defmodule LogbookWeb.LogController do
  use LogbookWeb, :controller

  alias Logbook.Book
  alias Logbook.Book.Log

  # p114 in Programming Phoenix, this adds current_user to all
  # action signatures in this controller module.
  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)
  end

  def index(conn, _params, current_user) do
    logs = Book.list_user_logs(current_user)
    render(conn, "index.html", logs: logs)
  end

  def new(conn, _params, _current_user) do
    changeset = Book.change_log(%Log{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"log" => log_params}, current_user) do
    case Book.create_log(current_user, log_params) do
      {:ok, log} ->
        conn
        |> put_flash(:info, "Log created successfully.")
        |> redirect(to: Routes.log_path(conn, :show, log))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, current_user) do
    log = Book.get_user_log!(current_user, id)
    render(conn, "show.html", log: log)
  end

  def edit(conn, %{"id" => id}, current_user) do
    log = Book.get_user_log!(current_user, id)
    changeset = Book.change_log(log)
    render(conn, "edit.html", log: log, changeset: changeset)
  end

  def update(conn, %{"id" => id, "log" => log_params}, current_user) do
    log = Book.get_user_log!(current_user, id)

    case Book.update_log(log, log_params) do
      {:ok, log} ->
        conn
        |> put_flash(:info, "Log updated successfully.")
        |> redirect(to: Routes.log_path(conn, :show, log))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", log: log, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, current_user) do
    log = Book.get_user_log!(current_user, id)
    {:ok, _log} = Book.delete_log(log)

    conn
    |> put_flash(:info, "Log deleted successfully.")
    |> redirect(to: Routes.log_path(conn, :index))
  end
end
