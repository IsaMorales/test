defmodule TimeTrackerBackend.Repo.Migrations.AddUserOrganization do
  use Ecto.Migration

  def change do
    create table(:users_organizations) do
      add :deleted, :boolean, default: false
      add :user_id, references(:users)
      add :organization_id, references(:organizations)

      timestamps()
    end
  end
end
