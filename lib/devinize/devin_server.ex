defmodule Devinize.DevinServer do
  use GenServer

  @jokes_file "lib/devin_jokes.json"

  @impl true
  def init(_args) do
    {:ok, [], {:continue, :setup_jokes}}
  end

  @impl true
  def handle_continue(:setup_jokes, _state) do
    state = parse_jokes()
    {:noreply, state}
  end

  @impl true
  def handle_call(:get_joke, _from, state) do
    joke = Enum.random(state)
    {:reply, joke, state}
  end

  defp parse_jokes() do
    @jokes_file
    |> File.read!()
    |> Jason.decode!()
    |> Enum.map(fn %{"message" => message} -> message end)
  end
end
