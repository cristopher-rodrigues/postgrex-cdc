defmodule RealtimeTest.Pokemons.Pokemon do
  use Ecto.Schema

  import Ecto.Changeset

  schema "pokemons" do
    field(:name, :string, null: false)

    timestamps()
  end

  @fields ~w(name)a

  def changeset(%__MODULE__{} = pokemon, attrs) do
    pokemon
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
