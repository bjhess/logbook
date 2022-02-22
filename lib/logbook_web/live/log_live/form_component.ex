defmodule LogbookWeb.LogLive.FormComponent do
  use LogbookWeb, :live_component

  alias Logbook.Book

  @impl true
  def update(%{log: log} = assigns, socket) do
    changeset = Book.change_log(log)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"log" => log_params}, socket) do
    changeset =
      socket.assigns.log
      |> Book.change_log(log_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"log" => log_params}, socket) do
    save_log(socket, socket.assigns.action, log_params)
  end

  defp save_log(socket, :edit, log_params) do
    case Book.update_log(socket.assigns.log, log_params) do
      {:ok, _log} ->
        {:noreply,
         socket
         |> put_flash(:info, "Log updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_log(socket, :new, log_params) do
    case Book.create_log(log_params) do
      {:ok, _log} ->
        {:noreply,
         socket
         |> put_flash(:info, "Log created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
