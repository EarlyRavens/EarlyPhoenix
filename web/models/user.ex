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
  end
end