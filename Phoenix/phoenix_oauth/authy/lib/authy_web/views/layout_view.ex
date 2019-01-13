defmodule AuthyWeb.LayoutView do
  use AuthyWeb, :view

  import Helpers.CurrentUser

  def menu_links(conn) do
    case get_state_of_current_user(conn) do
      {:anon, _user} -> auth_links(conn)
      {:saved, _user} -> user_links(conn)
    end
  end

  def auth_links(conn) do
    [ sign_in_link(conn, :github),
      sign_in_link(conn, :facebook),
      sign_in_link(conn, :google),
      sign_in_link(conn, :twitter) ]
  end

  def user_links(conn) do
    [sign_out_link(conn)]
  end

  def sign_in_link(conn, provider) when is_atom(provider) do
    sign_in_link(conn, Atom.to_string(provider))
  end

  def sign_in_link(conn, provider) do
    link to: auth_path(conn, :request, provider), class: "oauth-link" do
      img_tag("/images/oauth/#{provider}.png")
    end
  end

  def sign_out_link(conn) do
    link "Sign Out", to: auth_path(conn, :sign_out), method: :put
  end
end
