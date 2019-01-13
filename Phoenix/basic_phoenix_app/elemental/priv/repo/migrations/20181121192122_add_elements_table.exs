defmodule Elemental.Repo.Migrations.AddElementsTable do
  use Ecto.Migration

  def change do
    create table(:elements) do
      add :name, :string
      add :symbol, :string
      add :num_of_electrons, :integer
    end
  end
end
