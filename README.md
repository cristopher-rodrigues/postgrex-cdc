# RealtimeTest

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Setup PostgreSQL `bin/pg-setup.sh`
- Start the server through IEX `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

- Through the IEX console add a new Pokemon

```elixir
  %RealtimeTest.Pokemons.Pokemon{} |>
    RealtimeTest.Pokemons.Pokemon.changeset(%{name: Faker.Pokemon.name()}) |>
    RealtimeTest.Repo.insert()
```
