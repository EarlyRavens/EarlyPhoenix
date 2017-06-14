defmodule EarlyBird.SessionController do
  use EarlyBird.Web, :controller

  alias EarlyBird.User

  def login(conn, _pararms) do
    render(conn, "login.html")
  end

  def authenticate(conn, %{"user" => %{"email" => email, "password" => password}}) do

    user = Repo.get_by(User, email: email)

    cond do
      user && Comeonin.Bcrypt.checkpw(password, user.encrypted_password) ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index))
      true ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("login.html") 
    end
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end

end