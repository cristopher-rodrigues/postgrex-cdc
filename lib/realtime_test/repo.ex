defmodule RealtimeTest.Repo do
  use Ecto.Repo,
    otp_app: :realtime_test,
    adapter: Ecto.Adapters.Postgres
end
