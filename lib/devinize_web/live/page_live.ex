defmodule DevinizeWeb.PageLive do
  use DevinizeWeb, :live_view

  alias Devinize.DevinServer

  @impl true
  def mount(_params, _session, socket) do
    joke = DevinServer.get_joke()
    {:ok, assign(socket,  joke: joke)}
  end

  @impl true
  def handle_event("new_joke", _params, socket) do
    joke = DevinServer.get_joke()

    {:noreply, assign(socket, joke: joke)}
  end
end
