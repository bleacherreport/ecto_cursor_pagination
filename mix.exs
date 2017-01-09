defmodule EctoCursorPagination.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_cursor_pagination,
      build_embedded: Mix.env == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_deps: true,
        plt_file: ".local.plt"
      ],
      description: "Ecto Library for cursor pagination.",
      docs: [extras: ["README.md"]],
      elixir: "~> 1.3",
      homepage_url: "https://github.com/bleacherreport/ecto_cursor_pagination",
      name: "Ecto Cursor Pagination",
      package: package(),
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/bleacherreport/ecto_cursor_pagination",
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.1.1"
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:credo,       "~> 0.5",  only: [:dev]},
      {:dialyxir,    "~> 0.4",  only: [:dev]},
      {:earmark,     "~> 1.0",  only: [:dev]},
      {:ecto,        "~> 2.1"},
      {:ex_doc,      "~> 0.14", only: [:dev]},
      {:excoveralls, "~> 0.6",  only: [:test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/bleacherreport/ecto_cursor_pagination"},
      maintainers: ["John Kelly"]
    ]
  end
end
