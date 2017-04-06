defmodule UrlShortener.LandingPageController do
  use UrlShortener.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
