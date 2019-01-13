defmodule Elemental.ElementController do
  use Elemental.Web, :controller

  alias Elemental.Element

  def index(conn, _params) do
    elements = from(e in Element, order_by: e.num_of_electrons) |> Repo.all
    render conn, "index.html", elements: elements
  end

  def show(conn, %{"id" => element_id}) do
    element = Repo.get(Element, element_id)
    render conn, "show.html", element: element
  end

  def new(conn, _params) do
    changeset = Element.changeset(%Element{})
    render conn, "new.html", changeset: changeset
  end

  def edit(conn, %{"id" => element_id}) do
    changeset =
      Repo.get(Element, element_id)
      |> Element.changeset

    render conn, "edit.html", changeset: changeset, element: changeset.data
  end

  def create(conn, %{"element" => element}) do
    changeset = Element.changeset(%Element{}, element)

    case Repo.insert(changeset) do
      {:ok, element} ->
        conn
        |> put_flash(:info, "Element successfully created!")
        |> redirect(to: element_path(conn, :show, element))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "An error occured!")
        |> render("new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => element_id, "element" => element_params}) do
    changeset =
      Repo.get(Element, element_id)
      |> Element.changeset(element_params)

    case Repo.update(changeset) do
      {:ok, element} ->
        conn
        |> put_flash(:info, "Element successfully updated!")
        |> redirect(to: element_path(conn, :show, element))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "An error occured")
        |> render("edit.html", changeset: changeset, element: changeset.data)
    end
  end

  def delete(conn, %{"id" => element_id}) do
    Repo.get(Element, element_id) |> Repo.delete
    redirect(conn, to: element_path(conn, :index))
  end
end
