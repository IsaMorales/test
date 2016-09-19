defmodule TimeTrackerBackend.UserTest do
  use TimeTrackerBackend.ModelCase

  alias TimeTrackerBackend.User

  @valid_attrs %{
    first_name: "isamar",
    last_name: "morales",
    sex: "Female",
    email: "isamar@systrix.net",
    username: "sys.isamar",
    avatar: "/static/img/no-avatar.png"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
