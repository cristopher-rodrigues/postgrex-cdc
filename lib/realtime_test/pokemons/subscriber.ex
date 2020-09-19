defmodule RealtimeTest.Pokemons.Subscriber do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    Cainophile.Adapters.Postgres.subscribe(Cainophile.AppPublisher, self())

    {:ok, state}
  end

  @impl true
  def handle_info(%Cainophile.Changes.Transaction{
    changes: [
      %Cainophile.Changes.NewRecord{
        record: pokemon,
        relation: {"public", "pokemons"}
      }
    ]
  }, state) do
    RealtimeTestWeb.Endpoint.broadcast("pokemons", "new-pokemon", pokemon)

    {:noreply, state}
  end
end
