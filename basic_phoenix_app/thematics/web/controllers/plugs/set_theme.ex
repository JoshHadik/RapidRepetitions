defmodule Thematics.Plugs.SetTheme do
  @moduledoc """

  Responsible for assigning the current theme property on the conn object based on the sessions theme_id.

  """
  use Thematics.Web, :plug

  alias Thematics.Theme
  alias Thematics.Repo

  def init(_params), do: nil


  def call(conn, _params) do
    conn |> get_theme |> assign_theme
  end

  @default_theme %Theme{
    primary_color: "#000000",
    background_color: "#FFFFFF",
    text_color: "#000000"
  }

  defp get_theme(conn) do
    case get_session(conn, :theme_id) do
      nil -> {conn, @default_theme}
      theme_id -> {conn, Repo.get(Theme, theme_id)}
    end
  end

  defp assign_theme({conn, theme}) do
    assign(conn, :current_theme, theme)
  end
end
