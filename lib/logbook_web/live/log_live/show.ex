defmodule LogbookWeb.LogLive.Show do
  use LogbookWeb, :live_view

  alias Logbook.Book

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:log, Book.get_log!(id))}
  end

  defp page_title(:show), do: "Show Log"
  defp page_title(:edit), do: "Edit Log"
end
