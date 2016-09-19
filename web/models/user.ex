defmodule TimeTrackerBackend.User do
  use TimeTrackerBackend.Web, :model

  alias TimeTrackerBackend.UserOrganization
  alias TimeTrackerBackend.Organization

  schema "users" do
    #field :name, :string
    field :first_name, :string
    field :last_name, :string
    field :sex, :string
    field :email, :string
    field :username, :string
    field :avatar, :string, default: "/static/img/no-avatar.png"

    many_to_many :organizations, Organization, join_through: UserOrganization


    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :sex, :email, :avatar, :username ])
    |> validate_required([:first_name, :last_name, :email, :avatar])
  end
end
