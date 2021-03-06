# Ecto.CursorPagination
[![Hex pm](http://img.shields.io/hexpm/v/ecto_cursor_pagination.svg?style=flat)](https://hex.pm/packages/ecto_cursor_pagination)
[![Build Status](https://travis-ci.org/bleacherreport/ecto_cursor_pagination.svg?branch=master)](https://travis-ci.org/bleacherreport/ecto_cursor_pagination)
[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://github.com/bleacherreport/plug_logger_json/blob/master/LICENSE)

Cursor Pagination

Good Explanation of why cursor pagination is superior to offset/limit:

[http://blog.novatec-gmbh.de/art-pagination-offset-vs-value-based-paging/](http://blog.novatec-gmbh.de/art-pagination-offset-vs-value-based-paging/)
[https://www.percona.com/files/presentations/ppc2009/PPC2009_mysql_pagination.pdf](https://www.percona.com/files/presentations/ppc2009/PPC2009_mysql_pagination.pdf)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `ecto_cursor_pagination` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ecto_cursor_pagination, "~> 0.1.1"}]
    end
    ```

  2. Ensure `ecto_cursor_pagination` is started before your application:

    ```elixir
    def application do
      [applications: [:ecto_cursor_pagination]]
    end
    ```

### Recommended Setup
  * Configure this application
    * Add to your `config/config.exs` or each `config/env_name.exs`:

            config :ecto_cursor_pagination,
              per_page: 15,
              cursor_id: :id

## Example controller Action

    def index(conn, params) do
      last_seen_param = Map.get(params, "last_seen_id", "")
      direction_param = Map.get(params, "dir", "")

      query = Todo
              |> filter_by_uuid("user_id", params["user_id"])
              |> filter_by_string("name", params["name"])
              |> filter_by_string("type", params["type"])
      query = Ecto.CursorPagination.paginate(query, last_seen_param, direction_param)

      render(conn, "index.json", data: MyApp.Repo.all(query))
    end

## Contributing
Before submitting your pull request, please run:
  * `mix credo --strict`
  * `mix coveralls`
  * `mix dialyzer`

Please squash your pull request's commits into a single commit with a message and
detailed description explaining the commit.
