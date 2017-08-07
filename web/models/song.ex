defmodule VisualRater.Song do
  use VisualRater.Web, :model

  schema "songs" do
    field :name, :string
    field :rating, :float
    belongs_to :album, VisualRater.Album

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :rating])
    |> validate_required([:name, :rating])
  end
end
