defmodule Thematics.Repo.Migrations.CreateTheme do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :name, :string
      add :primary_color, :string

      timestamps()
    end
  end
end
