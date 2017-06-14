defmodule EarlyBird.Router do
  use EarlyBird.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    # Sets user key-value to conn.assigns
    plug EarlyBird.Plug.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EarlyBird do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController, only: [:new, :create]

    get "/login", SessionController, :login
    post "/login", SessionController, :authenticate
    get "/logout", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", EarlyBird do
  #   pipe_through :api
  # end
end
