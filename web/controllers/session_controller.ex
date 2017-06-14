defmodule EarlyBird.SessionController do
  use EarlyBird.Web, :controller

  alias EarlyBird.User

  def login(conn, _pararms) do
    changeset = User.changeset(%User{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def authenticate(conn, %{"user" => %{"email" => email, "password" => password}}) do

    user = Repo.get_by(User, email: email)

    # result = 
    #   cond do
    #     user && checkpw(password, user.encrypted_password)
    #   end

    IO.puts "********"
    IO.inspect email
    IO.inspect password
    IO.inspect user

    # changeset = User.changeset()

    redirect(conn, to: page_path(conn, :index))
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end

end