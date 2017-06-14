defmodule EarlyBird.UserController do
  use EarlyBird.Web, :controller

  alias EarlyBird.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})

    render(conn, "new.html", changeset: changeset)
  end   

  def create(conn, %{"user" => user_params}) do
    changeset = %User{} |> User.changeset(user_params)
    
    case Repo.insert(changeset) do
    {:ok, user} ->
      conn
      |> put_flash(:info, "#{user.username} created!")
      |> redirect(to: page_path(conn, :index))
    {:error, changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end
end