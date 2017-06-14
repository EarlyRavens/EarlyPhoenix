defmodule EarlyBird.PageController do
  use EarlyBird.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
