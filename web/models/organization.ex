defmodule TimeTrackerBackend.Organization do
  use TimeTrackerBackend.Web, :model

  alias TimeTrackerBackend.UserOrganization
  alias TimeTrackerBackend.Project
  alias TimeTrackerBackend.User

  schema "organizations" do
    field :name, :string
    field :is_active, :boolean, default: true
    field :logo, :string, default: "/static/img/no_logo.png"
    field :team_size, :string
    field :description, :string
    field :created_by, :integer, default: 1
    field :deleted, :boolean, default: false

    has_many :projects, Project
    many_to_many :users, User, join_through: UserOrganization

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :is_active, :logo, :team_size, :description, :created_by, :deleted])
    |> validate_required([:name, :team_size])
  end
end
