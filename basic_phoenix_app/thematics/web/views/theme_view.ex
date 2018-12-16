defmodule Thematics.ThemeView do
  use Thematics.Web, :view

  def show_theme_link(conn, theme) do
    link theme.name, to: theme_path(conn, :show, theme)
  end

  def edit_theme_link(conn, theme) do
    link "Edit", to: theme_path(conn, :edit, theme)
  end

  def delete_theme_link(conn, theme) do
    link "Delete", to: theme_path(conn, :delete, theme), method: :delete, data: [confirm: "Are you sure?"]
  end

  def query_theme_link(text, conn, order) do
    case conn.params["order"] == Atom.to_string(order) do
      true -> content_tag(:a, text, class: "current")
      false -> link text, to: theme_path(conn, :index, order: order)
    end
  end

  def set_theme_link(conn, theme) do
    IO.inspect(conn)
    case conn.assigns.current_theme == theme do
      true ->
        content_tag(:a, "Active", class: "current")
      false ->
        link "Activate", to: session_path(conn, :update_theme, theme.id, redirect: "#{conn.request_path}?#{conn.query_string}"), method: :put
    end
  end

  def color_swatch(size \\ :small, color) do
    content_tag(:div, "", class: "color-swatch color-swatch-#{size}", style: "--color: #{color}")
  end

  def heading(size \\ 1, content) do
    unless size in [1,2,3,4,5,6], do: size = 1
    content_tag(:"h#{size}", content, class: "h#{size}-like")
  end
end
