defmodule VisualRater.SongTest do
  use VisualRater.ModelCase

  alias VisualRater.Song

  @valid_attrs %{name: "some content", rating: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Song.changeset(%Song{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Song.changeset(%Song{}, @invalid_attrs)
    refute changeset.valid?
  end
end
