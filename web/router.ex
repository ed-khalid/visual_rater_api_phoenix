defmodule VisualRater.Router do
  use VisualRater.Web, :router

  pipeline :api do
    plug Corsica, origins: "http://localhost:3000"
    plug :accepts, ["json"]
  end

  scope "/", VisualRater do
   pipe_through :api
   resources "/artists", ArtistController, param: "name"
   resources "/albums", AlbumController
   resources "/songs", SongController
  end
end
