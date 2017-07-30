defmodule Discuss.Topic do
  use Discuss.Web, :model

  #look inside Postgres db, find "topics"
  #create a "title" and it is to be a string
  schema "topics" do
    field :title, :string
  end

  #The "\\" denotes a default argument
  #In this case the "\\" denotes that params is an empty struct be default
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
