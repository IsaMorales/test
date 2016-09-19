defmodule TimeTrackerBackend.UserOrganization do
  use TimeTrackerBackend.Web, :model

  alias TimeTrackerBackend.User
  alias TimeTrackerBackend.Organization
  #alias Group

  schema "users_organizations" do
    belongs_to :user, User
    belongs_to :organization, Organization
    field :deleted, :boolean, default: false

    timestamps
  end
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:organization_id, :user_id])
    |> validate_required([:organization_id, :user_id])
  end
end
