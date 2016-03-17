defmodule Anatomic.PageController do
  use Anatomic.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
