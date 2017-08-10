defmodule VisualRater.ArtistController do
  use VisualRater.Web, :controller

  alias VisualRater.Artist

  def index(conn, _params) do
    artists = Repo.all(Artist)
    render(conn, "index.json", artists: artists)
  end

  def create(conn, %{"artist" => artist_params}) do
    changeset = Artist.changeset(%Artist{}, artist_params)

    case Repo.insert(changeset) do
      {:ok, artist} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", artist_path(conn, :show, artist))
        |> render("show.json", artist: artist)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VisualRater.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"name" => name}) do
    artist = Repo.get_by(Artist, name: name)
    render(conn, "show.json", artist: artist)
  end

  def update(conn, %{"id" => id, "artist" => artist_params}) do
    artist = Repo.get!(Artist, id)
    changeset = Artist.changeset(artist, artist_params)

    case Repo.update(changeset) do
      {:ok, artist} ->
        render(conn, "show.json", artist: artist)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(VisualRater.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Repo.get!(Artist, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artist)

    send_resp(conn, :no_content, "")
  end
end
