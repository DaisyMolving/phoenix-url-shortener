defmodule UrlShortener.LandingPageController do
  use UrlShortener.Web, :controller

  defstruct url_to_shorten: ""

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
    url_input = conn.body_params["url_to_shorten"]
    if (is_valid(url_input)) do
      render conn, "create.html", acknowledgement_message: "You entered: #{url_input}" 
    else 
      render conn, "create.html", acknowledgement_message: "That is not a valid url, please try again." 
    end
  end

  defp is_valid(url_input) do
    Regex.match?(~r/(http(s)?:\/\/).+/, url_input)
  end

end
