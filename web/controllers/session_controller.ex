defmodule EarlyBird.SessionController do
  use EarlyBird.Web, :controller

  alias EarlyBird.User

  def new(conn, _pararms) do
    changeset = User.changeset(%User{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    
  end
end