defmodule UrlShortenerTest do
  use ExUnit.Case

  test "a short url is created with given host" do
    assert UrlShortener.create_short_url("http://localhost:4000/") == "http://localhost:4000/aA0"
  end

  #  test "a short url is not created if the long_url is already in memory" do
  #  assert UrlShortener.look_up_long_url("http://example.com/long/url?param=1") 
  #end

end
