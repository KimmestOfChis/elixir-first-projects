defmodule Discuss.Router do
  use Discuss.Web, :router

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

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    #get "/", TopicController, :index
    #whenever somone sends my site a GET request with "topics/new"
    #Enact the topic controller's "new" function
    #get "/topics/new", TopicController, :new
    #post "/topics", TopicController, :create
    #get "topics/:id/edit", TopicController, :edit
    #put "/topics/:id", TopicController, :update
    resources "/", TopicController #only works if following restful conventions
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
