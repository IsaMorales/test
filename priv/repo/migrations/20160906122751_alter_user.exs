defmodule TimeTrackerBackend.Repo.Migrations.AlterUser do
  use Ecto.Migration

  def change do
      alter table(:users) do
        remove :name
        add :first_name, :string
        add :last_name, :string
        add :sex, :string
        add :email, :string
        add :username, :string
        add :avatar, :string

      end
  end
end
