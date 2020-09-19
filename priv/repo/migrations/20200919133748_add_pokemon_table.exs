defmodule RealtimeTest.Repo.Migrations.AddPokemonTable do
  use Ecto.Migration

  def up do
    create table(:pokemons) do
      add(:name, :string, null: false)

      timestamps()
    end
  end

  def drop do
    drop table(:pokemons)
  end
end
