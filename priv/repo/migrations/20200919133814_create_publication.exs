defmodule RealtimeTest.Repo.Migrations.CreatePublication do
  use Ecto.Migration

  def up do
    execute("CREATE PUBLICATION app_publication FOR TABLE pokemons;")
  end

  def down do
    execute("DROP PUBLICATION app_publication;")
  end
end
