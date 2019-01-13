defmodule AuthyWeb.AuthController do
  use AuthyWeb, :controller

  alias Authy.Auth

  plug Ueberauth

  # Actions

  def callback(conn, params) do
    case handle(:get_or_create_user, conn, params) do
      {:ok, user} ->
        conn |> pipe(:sign_in, :green, user.id)
      {:error, reason} ->
        IO.inspect(reason)
        conn |> pipe(:sign_in, :red)
    end
  end

  def sign_out(conn, _params) do
    conn |> pipe(:sign_out)
  end

  # Handlers

  def handle(:get_or_create_user, conn, params) do
    get_user_params_from_ueberauth_callback(conn, params)
    |> Auth.get_or_create_user
  end

  # Pipes

  def pipe(conn, :sign_in, :green, user_id) do
    conn
    |> put_session(:user_id, user_id)
    |> put_flash(:info, "You were successfully signed in!")
    |> redirect(to: page_path(conn, :index))
  end

  def pipe(conn, :sign_in, :red) do
    conn
    |> put_flash(:error, "Something went wrong!")
    |> redirect(to: page_path(conn, :index))
  end

  def pipe(conn, :sign_out) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "You have been logged out!")
    |> redirect(to: page_path(conn, :index))
  end

  # Helpers

  def get_user_params_from_ueberauth_callback(%{assigns: %{ueberauth_auth: auth}}, %{"provider" => provider}) do
    %{uid: auth.uid, email: auth.info.email, provider: provider}
  end
end
