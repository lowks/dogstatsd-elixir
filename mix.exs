defmodule DogStatsd.Mixfile do
  use Mix.Project

  def project do
    [app: :dogstatsd,
     version: version,
     elixir: "~> 1.0",
     test_coverage: [tool: ExCoveralls],
     deps: deps,
     package: [
       contributors: ["Adam Kittelson"],
       licenses: ["MIT"],
       links: %{ github: "https://github.com/adamkittelson/dogstatsd-elixir" },
       files: ["lib/*", "mix.exs", "README.md", "LICENSE.md", "CHANGELOG.md", "VERSION.yml"]
     ],
     description: "A client for DogStatsd, an extension of the StatsD metric server for Datadog."
     ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
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
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:excoveralls, "~> 0.3.4", only: [:dev, :test]}]
  end

  defp version do
     ~r/[0-9]+/
     |> Regex.scan(File.read!("VERSION.yml"))
     |> List.flatten
     |> Enum.join(".")
  end
end
