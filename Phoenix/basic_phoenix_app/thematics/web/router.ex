defmodule Thematics.Router do
  use Thematics.Web, :router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Thematics.Plugs.SetTheme
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Thematics do
    pipe_through :browser # Use the default browser stack

    get "/", ThemeController, :index
    resources "/themes", ThemeController
    put "/session/theme/:id", SessionController, :update_theme
  end


  # Other scopes may use custom stacks.
  # scope "/api", Thematics do
  #   pipe_through :api
  # end
end
