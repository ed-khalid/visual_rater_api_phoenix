defmodule VisualRater.AlbumView do
  use VisualRater.Web, :view

  def render("index.json", %{albums: albums}) do
    %{data: render_many(albums, VisualRater.AlbumView, "album.json")}
  end

  def render("show.json", %{album: album}) do
    %{data: render_one(album, VisualRater.AlbumView, "album.json")}
  end

  def render("album.json", %{album: album}) do
    %{id: album.id,
      name: album.name,
      year: album.year}
  end
end
