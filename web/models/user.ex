defmodule EarlyBird.User do
  use EarlyBird.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :encrypted_password])
    |> validate_required([:username, :email, :encrypted_password])
    |> validate_length(:encrypted_password, min: 6)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end