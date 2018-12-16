defmodule Elemental.ElementView do
  use Elemental.Web, :view

  def show_link(text, conn, element) do
    link(text, to: element_path(conn, :show, element))
  end

  def show_link(conn, element) do
    show_link(element.name, conn, element)
  end

  def edit_link(conn, element) do
    link "Edit", to: element_path(conn, :edit, element)
  end

  def delete_link(conn, element) do
    link "Delete", to: element_path(conn, :delete, element), method: :delete, data: [confirm: "Are you sure?"]
  end
end
