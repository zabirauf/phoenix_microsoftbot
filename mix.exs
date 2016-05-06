defmodule PhoenixMicrosoftbot.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_microsoftbot,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:phoenix, "~> 1.1"},
      {:ex_microsoftbot, github: "zabirauf/ex_microsoftbot"},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:dialyxir, "~> 0.3", only: [:dev]},
      {:ex_doc, "~> 0.11.5", only: [:dev]}
    ]
  end
end
