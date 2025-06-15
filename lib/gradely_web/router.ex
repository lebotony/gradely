defmodule GradelyWeb.Router do
  use GradelyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GradelyWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Gradely.Plugs.SetUser
  end

  pipeline :auth do
    plug Gradely.Guardian.AuthPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  scope "/auth", GradelyWeb do
    pipe_through :browser

    get "/google", GoogleAuthController, :request
    get "/google/callback", GoogleAuthController, :callback
    get "/logout", GoogleAuthController, :signout
  end

  scope "/api", GradelyWeb.Api, as: :api do
    pipe_through [:api, :auth]

    post "/register", UserController, :create
    post "/fetch_user", UserController, :get_user
    post "/login", SessionController, :login
    post "/logout", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  scope "/", GradelyWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/*path", PageController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GradelyWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
