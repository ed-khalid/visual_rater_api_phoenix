defmodule VisualRater.Router do
  use VisualRater.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VisualRater do
   pipe_through :api
   resources "/artists", VisualRater.ArtistController
   resources "/albums", VisualRater.AlbumController
   resources "/songs", VisualRater.SongController
  end
end
