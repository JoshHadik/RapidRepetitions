defmodule Authy.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :provider, :string
    field :uid, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    updated_attrs = Map.put(attrs, :uid, "#{attrs.uid}")

    user
    |> cast(updated_attrs, [:uid, :email, :provider])
    |> put_change(:uid, "#{attrs.uid}")
    |> validate_required([:uid, :provider])
  end

end
