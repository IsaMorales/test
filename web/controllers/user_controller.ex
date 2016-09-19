defmodule TimeTrackerBackend.UserController do
  use TimeTrackerBackend.Web, :controller

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end
"""
  def index2(conn, %{"organization_id" => organization_id}) do
    #users = Repo.all(User)
    users = Repo.all(
     from uo in UserOrganizacion,
       join: u in User,
       on: uo.user_id == u.id,
       join: o in Organization,
       on: uo.organization_id == o.id,
       where: uo.organization_id == ^organization_id,
       select: %{:id => u.id, :first_name =>u.first_name, :last_name => u.last_name, :username => u.username, :email => u.email, :avatar => u.avatar}
    )

    render(conn, "index.json", users: users)
  end
"""
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeTrackerBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        render(conn, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeTrackerBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end
end
