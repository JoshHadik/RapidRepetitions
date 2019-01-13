defmodule Authy.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uid, :string
      add :email, :string
      add :provider, :string

      timestamps()
    end

    create index(:users, [:uid])
    create unique_index(:users, [:uid, :provider])
  end
end
