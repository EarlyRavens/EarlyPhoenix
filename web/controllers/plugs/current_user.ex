defmodule EarlyBird.Plug.CurrentUser do
  import Plug.Conn
  import Phoenix.Controller

  alias EarlyBird.Repo
  alias EarlyBird.User

  def init(_params) do
  end

  # params is the return value of the init
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        # assigns key-value to conn.assigns, and returns conn
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end