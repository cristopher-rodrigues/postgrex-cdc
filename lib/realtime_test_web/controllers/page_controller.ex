defmodule RealtimeTestWeb.PageController do
  use RealtimeTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
