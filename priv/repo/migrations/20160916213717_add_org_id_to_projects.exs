defmodule TimeTrackerBackend.Repo.Migrations.AddOrgIdToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
       add :organization_id, references(:organizations), null: true

    end
  end
end
