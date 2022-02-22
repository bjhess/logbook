defmodule LogbookWeb.LogLive.LogComponent do
  use LogbookWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={"log-#{@log.id}"} class="log">
      <div class="row">
        <div class="column column-90 log-body">
          <b>@<%= @log.username %></b>
          <br/>
          <%= @log.body %>
        </div>
        <div class="column column-10 log-button-column">
          <%= live_patch to: Routes.log_index_path(@socket, :edit, @log.id) do %>
            edit
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @log.id do %>
            delete
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
