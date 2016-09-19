defmodule TimeTrackerBackend.OrganizationTest do
  use TimeTrackerBackend.ModelCase

  alias TimeTrackerBackend.Organization

  @valid_attrs %{
    name: "systrix",
    is_active: true,
    logo: "/static/img/no_logo.png",
    team_size: "10",
    description: "prueba",
    created_by: 1,
    deleted: false
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Organization.changeset(%Organization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Organization.changeset(%Organization{}, @invalid_attrs)
    refute changeset.valid?
  end
end
