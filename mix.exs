defmodule OpenAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :open_api,
      version: "0.1.0",
      elixir: "~> 1.8",
      name: "OpenAPI",
      docs: [
        main: "OpenAPI",
        extras: ["README.md"]
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.19", only: [:dev], runtime: false},
      {:yaml_elixir, "~> 2.0.0", only: [:dev, :test]}
    ]
  end
end
