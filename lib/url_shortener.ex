defmodule UrlShortener do
  use Application

  @lower_case_letters ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @upper_case_letters ~w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  @digits ~w(0 1 2 3 4 5 6 7 8 9)

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

  def create_short_url(host) do
    host <> Enum.at(@lower_case_letters, 0) <> Enum.at(@upper_case_letters, 0) <> Enum.at(@digits, 0)
  end

end
