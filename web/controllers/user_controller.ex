defmodule EarlyBird.UserController do
  use EarlyBird.Web, :controller

  alias EarlyBird.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})

    render(conn, "new.html", changeset: changeset)
  end   

  def create(conn, params) do
    IO.puts "*********"
    IO.inspect params

    redirect(conn, to: page_path(conn, :index))
  end
end