defmodule Discuss.TopicController do
  #need to inherit from web/web.ex
  #it's pretty kewl
  #conn is short for "connection"
  alias Discuss.Topic

  use Discuss.Web, :controller
    def new(conn, params) do
      struct = %Topic{} #aliased Discuss.Topic -> Topic
      params = %{}
      changeset = Topic.changeset(%Topic{}, %{})

      render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"topic" => topic} ) do
      
    end
end
