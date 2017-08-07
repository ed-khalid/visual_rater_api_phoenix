defmodule VisualRater.AlbumTest do
  use VisualRater.ModelCase

  alias VisualRater.Album

  @valid_attrs %{name: "some content", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Album.changeset(%Album{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Album.changeset(%Album{}, @invalid_attrs)
    refute changeset.valid?
  end
end
