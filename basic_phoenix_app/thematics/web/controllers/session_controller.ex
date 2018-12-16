defmodule Thematics.SessionController do
  use Thematics.Web, :controller

  def update_theme(conn, %{"id" => theme_id, "redirect" => redirect_path}) do
    conn
    |> put_session(:theme_id, theme_id)
    |> redirect(to: redirect_path)
  end
end
