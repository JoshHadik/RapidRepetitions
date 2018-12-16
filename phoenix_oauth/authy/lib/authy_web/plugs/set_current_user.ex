defmodule AuthyWeb.Plugs.SetCurrentUser do
  use AuthyWeb, :plug

  alias Authy.Auth

  def init(_params), do: nil

  def call(conn, _params) do
    conn |> get_user |> check_user |> assign_user
  end

  # Request user based on user id OR return anonymous user
  defp get_user(conn) do
    case get_session(conn, :user_id) do
      nil ->
        {conn, Auth.anonymous_user()}
      user_id ->
        {conn, Auth.get_user(user_id)}
    end
  end

  # Return user if found from user id OR create anonymous user
  # Necessary in case someone revokes app on OAuth provider without signing out in browser and then tries to reauthenticate while invalid user id is still saved to session.
  defp check_user({conn, user}) do
    case user do
      nil -> { clear_invalid_user_id(conn), Auth.anonymous_user() }
      user -> {conn, user}
    end
  end

  defp assign_user({conn, user}) do
    assign(conn, :current_user, user)
  end

  defp clear_invalid_user_id(conn) do
    conn |> delete_session(:user_id)
  end
end
