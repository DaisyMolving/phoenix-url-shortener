defmodule UrlShortener do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(UrlShortener.Repo, []),
      supervisor(UrlShortener.Endpoint, []),
    ]
    opts = [strategy: :one_for_one, name: UrlShortener.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    UrlShortener.Endpoint.config_change(changed, removed)
    :ok
  end

end
