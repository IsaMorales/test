defmodule TimeTrackerBackend.Repo.Migrations.AddOrganization do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name, :string
      add :is_active, :boolean, default: true
      add :logo, :string, default: "/static/img/no_logo.png"
      add :team_size, :string
      add :description, :string
      add :created_by, :integer, default: 1
      add :deleted, :boolean, default: false

      timestamps()
    end
  end
end
