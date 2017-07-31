defmodule Discuss.TopicController do
  #need to inherit from web/web.ex
  #it's pretty kewl
  #conn is short for "connection"
  alias Discuss.Topic

  use Discuss.Web, :controller
    def index(conn, _params) do
      topics = Repo.all(Topic)
      render conn, "index.html", topics: topics
    end

    def new(conn, _params) do
      struct = %Topic{} #aliased Discuss.Topic -> Topic
      params = %{}
      changeset = Topic.changeset(%Topic{}, %{})

      render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"topic" => topic} ) do
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
      end
    end

    def edit(conn, %{"id" => topic_id}) do
      topic = Repo.get(Topic, topic_id)
      changeset = Topic.changeset(topic)

      render conn, "edit.html", changeset: changeset, topic: topic
    end

    def update(conn, %{"id" => topic_id, "topic" => topic}) do
      old_topic = Repo.get(Topic, topic_id)
      changeset = Topic.changeset(old_topic, topic)

      case Repo.update(changeset) do
        {:ok, _topic} ->
          conn
          |> put_flash(:info, "Topic Updated")
          |> redirect(to: topic_path(conn, :index))
        {:error, changeset} ->
          render conn, "edit.html", changeset: changeset, topic: old_topic
      end
    end

    def delete(conn, %{"id" => topic_id}) do
      Repo.get!(Topic, topic_id) |> Repo.delete!

      conn
      |> put_flash(:info, "Topic Successfully Deleted")
      |> redirect(to: topic_path(conn, :index))
    end

end
