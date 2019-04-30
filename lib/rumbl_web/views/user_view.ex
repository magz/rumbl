defmodule RumblWeb.UserView do
  use RumblWeb, :view
  alias Rumbl.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def last_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(-1)
  end
end
