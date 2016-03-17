defmodule Anatomic.PartController do
  use Anatomic.Web, :controller

  alias Anatomic.Part

  plug :scrub_params, "part" when action in [:create, :update]

  def index(conn, _params) do
    parts = Repo.all(Part)
    render(conn, "index.html", parts: parts)
  end

  def new(conn, _params) do
    changeset = Part.changeset(%Part{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"part" => part_params}) do
    changeset = Part.changeset(%Part{}, part_params)

    case Repo.insert(changeset) do
      {:ok, _part} ->
        conn
        |> put_flash(:info, "Part created successfully.")
        |> redirect(to: part_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    part = Repo.get!(Part, id)
    render(conn, "show.html", part: part)
  end

  def edit(conn, %{"id" => id}) do
    part = Repo.get!(Part, id)
    changeset = Part.changeset(part)
    render(conn, "edit.html", part: part, changeset: changeset)
  end

  def update(conn, %{"id" => id, "part" => part_params}) do
    part = Repo.get!(Part, id)
    changeset = Part.changeset(part, part_params)

    case Repo.update(changeset) do
      {:ok, part} ->
        conn
        |> put_flash(:info, "Part updated successfully.")
        |> redirect(to: part_path(conn, :show, part))
      {:error, changeset} ->
        render(conn, "edit.html", part: part, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    part = Repo.get!(Part, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(part)

    conn
    |> put_flash(:info, "Part deleted successfully.")
    |> redirect(to: part_path(conn, :index))
  end
end
