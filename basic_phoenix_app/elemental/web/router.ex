defmodule Elemental.Router do
  use Elemental.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Elemental do
    pipe_through :browser # Use the default browser stack

    get "/", ElementController, :index
    resources "/elements", ElementController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Elemental do
  #   pipe_through :api
  # end
end
