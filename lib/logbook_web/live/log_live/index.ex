defmodule LogbookWeb.LogLive.Index do
  use LogbookWeb, :live_view

  alias Logbook.Book
  alias Logbook.Book.Log

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Book.subscribe()
    {:ok, assign(socket, :logs, list_logs()), temporary_assigns: [logs: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Log")
    |> assign(:log, Book.get_log!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Log")
    |> assign(:log, %Log{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Logs")
    |> assign(:log, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    log = Book.get_log!(id)
    {:ok, _} = Book.delete_log(log)

    {:noreply, assign(socket, :logs, list_logs())}
  end

  @impl true
  def handle_info({:log_created, log}, socket) do
    {:noreply, update(socket, :logs, fn logs -> [log | logs ] end)}
  end

  def handle_info({:log_updated, log}, socket) do
    {:noreply, update(socket, :logs, fn logs -> [log | logs ] end)}
  end

  defp list_logs do
    Book.list_logs()
  end
end
