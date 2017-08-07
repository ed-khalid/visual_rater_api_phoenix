defmodule VisualRater.Artist do
  use VisualRater.Web, :model

  schema "artists" do
    has_many :albums, VisualRater.Album 
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
