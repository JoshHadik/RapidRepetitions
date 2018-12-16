defmodule Thematics.ThemeController do
  use Thematics.Web, :controller
  alias Thematics.Theme
  alias Thematics.Queries.ThemeQuery

  def index(conn, %{"order" => order}) do
    themes = ThemeQuery.all(order)
    render conn, "index.html", themes: themes
  end

  def index(conn, _params) do
    themes = Repo.all(Theme)
    render conn, "index.html", themes: themes
  end

  def show(conn, %{"id" => theme_id}) do
    theme = Repo.get(Theme, theme_id)
    render conn, "show.html", theme: theme
  end

  def new(conn, _params) do
    changeset = Theme.changeset(%Theme{})
    render conn, "new.html", changeset: changeset, theme: changeset.data
  end

  def edit(conn, %{"id" => theme_id}) do
    changeset = Theme
      |> Repo.get(theme_id)
      |> Theme.changeset

    render conn, "edit.html", changeset: changeset, theme: changeset.data
  end

  def create(conn, %{"theme" => theme_params}) do
    changeset = Theme.changeset(%Theme{}, theme_params)

    case Repo.insert(changeset) do
      {:ok, theme} ->
        conn
        |> put_flash(:info, "#{theme.name} was created!")
        |> redirect(to: theme_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "An error occured")
        |> render("new.html", changeset: changeset, theme: changeset.data)
    end
  end

  def update(conn, %{"id" => theme_id, "theme" => theme_params}) do
    changeset = Theme
      |> Repo.get(theme_id)
      |> Theme.changeset(theme_params)

    case Repo.update(changeset) do
      {:ok, theme} ->
        conn
        |> put_flash(:info, "#{theme.name} was updated!")
        |> redirect(to: theme_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "An error occured")
        |> render("edit.html", changeset: changeset, theme: changeset.data)
    end
  end

  def delete(conn, %{"id" => theme_id}) do
    Theme |> Repo.get(theme_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Theme was deleted")
    |> redirect to: theme_path(conn, :index)
  end
end
