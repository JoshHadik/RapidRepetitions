defmodule AuthyWeb.Helpers.CurrentUser do
  alias Authy.Auth
  
  def current_user(conn) do
    conn.assigns[:current_user]
  end

  def get_state_of_current_user(conn) do
    conn
    |> current_user()
    |> Auth.match_state_with_user()
  end
end
