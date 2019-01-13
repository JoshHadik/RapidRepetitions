defmodule Thematics.Theme do
  use Thematics.Web, :model

  schema "themes" do
    field :name, :string
    field :primary_color, :string
    field :background_color, :string
    field :text_color, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :primary_color, :background_color, :text_color])
    |> validate_required([:name, :primary_color, :text_color, :background_color])
    |> validate_color_is_in_hex(:primary_color)
    |> validate_color_is_in_hex(:background_color)
    |> validate_color_is_in_hex(:text_color)
  end

  defp validate_color_is_in_hex(changeset, field) do
    validate_change changeset, field, fn(_,color) ->
      case Regex.match?(~r/^#(([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3})$/, color) do
        true -> []
        false -> [{field, "Must be in hex format (eg: #11ff33)."}]
      end
    end
  end
end
