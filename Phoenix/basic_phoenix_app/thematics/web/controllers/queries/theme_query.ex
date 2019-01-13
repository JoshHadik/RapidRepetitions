defmodule Thematics.Queries.ThemeQuery do
  use Thematics.Web, :query

  alias Thematics.Theme
  alias Thematics.Repo

  def all(order_label) do
    from(t in Theme, order_by: ^order(order_label)) |> Repo.all
  end

  defp order("by_date"), do: [desc: :inserted_at]
  defp order("by_color"), do: [desc: :primary_color]
  defp order("by_name"), do: [asc: :name]
  defp order("by_updated_at"), do: [desc: :updated_at]
  defp order(_unknown_query), do: []
end
