defmodule TimeTrackerBackend.UserOrganizationTest do
  use TimeTrackerBackend.ModelCase

  alias TimeTrackerBackend.UserOrganization
  
  @valid_attrs %{
    user_id: 1,
    organization_id: 1
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserOrganization.changeset(%UserOrganization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserOrganization.changeset(%UserOrganization{}, @invalid_attrs)
    refute changeset.valid?
  end

end
