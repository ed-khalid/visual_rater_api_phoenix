defmodule VisualRater.Album do
  use VisualRater.Web, :model

  schema "albums" do
    field :name, :string
    field :year, :integer
    belongs_to :artist, VisualRater.Artist
    has_many :songs, VisualRater.Song

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :year])
    |> validate_required([:name, :year])
  end
end
