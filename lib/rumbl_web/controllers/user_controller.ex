defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Repo
  alias Rumbl.User

  def index(conn, _params) do
    render(conn, "index.html", %{users: Repo.all(User)})
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", %{user: Repo.get(User, id)})
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    {:ok, user} = Repo.insert(changeset)

    conn
    |> put_flash(:info, "#{user.name} created!")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
