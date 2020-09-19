defmodule RealtimeTest.Repo.Migrations.ChangePokemonToFullReplicaIdentity do
  use Ecto.Migration

  def up do
    execute("ALTER TABLE pokemons REPLICA IDENTITY FULL;")
  end

  def down do
    execute("ALTER TABLE pokemons REPLICA IDENTITY DEFAULT;")
  end
end
