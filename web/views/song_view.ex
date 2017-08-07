defmodule VisualRater.SongView do
  use VisualRater.Web, :view

  def render("index.json", %{songs: songs}) do
    %{data: render_many(songs, VisualRater.SongView, "song.json")}
  end

  def render("show.json", %{song: song}) do
    %{data: render_one(song, VisualRater.SongView, "song.json")}
  end

  def render("song.json", %{song: song}) do
    %{id: song.id,
      name: song.name,
      rating: song.rating}
  end
end
