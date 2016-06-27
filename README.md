# Ecto.CursorPagination

Cursor Pagination

Good Explanation of why cursor pagination is superior to offset/limit:

[http://blog.novatec-gmbh.de/art-pagination-offset-vs-value-based-paging/](http://blog.novatec-gmbh.de/art-pagination-offset-vs-value-based-paging/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `ecto_cursor_pagination` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ecto_cursor_pagination, "~> 0.1.0"}]
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
              per_page: 15

## Contributing

Pull requests are welcomed. Before submitting your pull request, please run:
* `mix credo --strict`
* `mix coveralls`
* `mix dialyzer`

If there are any issues they should be corrected before submitting a pull request
