defmodule Thematics.Repo.Migrations.AddBgColorAndTextColorToTheme do
  use Ecto.Migration

  def change do
    alter table(:themes) do
      add :background_color, :string
      add :text_color, :string
    end
  end
end
