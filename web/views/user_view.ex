defmodule TimeTrackerBackend.UserView do
  use TimeTrackerBackend.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, TimeTrackerBackend.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, TimeTrackerBackend.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      sex: user.sex,
      email: user.email,
      username: user.username,
      avatar: user.avatar
    }
  end
end
