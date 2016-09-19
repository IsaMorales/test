defmodule TimeTrackerBackend.OrganizationView do
  use TimeTrackerBackend.Web, :view

  def render("index.json", %{organization: organization}) do
    %{data: render_many(organization, TimeTrackerBackend.OrganizationView, "organization.json")}
  end

  def render("show.json", %{organization: organization}) do
    %{data: render_one(organization, TimeTrackerBackend.OrganizationView, "organization2.json")}
  end

  def render("organization.json", %{organization: organization}) do
    %{
      id: organization.id,
      name: organization.name,
      is_active: organization.is_active,
      logo: organization.logo,
      team_size: organization.team_size,
      description: organization.description,
      created_by: organization.created_by,
      deleted: organization.deleted
    }
  end

  def render("organization2.json", %{organization: organization}) do
    %{
      id: organization.id,
      name: organization.name,
      is_active: organization.is_active,
      logo: organization.logo,
      team_size: organization.team_size,
      description: organization.description,
      created_by: organization.created_by,
      deleted: organization.deleted,
      users: Enum.map(organization.users , fn(user) -> %{ "first_name" => user.first_name, "last_name" => user.last_name } end)
    }
  end
end
