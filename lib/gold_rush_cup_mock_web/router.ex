defmodule GoldRushCupMockWeb.Router do
  use GoldRushCupMockWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GoldRushCupMockWeb do
    pipe_through :api

    post "/licenses", PageController, :get_license
    post "/explore", PageController, :explore
    post "/dig", PageController, :dig
    post "/cash", PageController, :cash
    get "/balance", PageController, :balance
  end
end
