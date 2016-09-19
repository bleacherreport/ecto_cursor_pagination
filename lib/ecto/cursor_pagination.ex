defmodule Ecto.CursorPagination do
  @moduledoc """
  Cursor / Value based pagination using Ecto

  http://blog.novatec-gmbh.de/art-pagination-offset-vs-value-based-paging/
  """

  import Ecto.Query, only: [limit: 2, where: 3, order_by: 2]

  @per_page Application.fetch_env!(:ecto_cursor_pagination, :per_page)

  @doc """
  Efficiently returns a maximum of `per_page` configured results.

  Assumes cursor_ids are integers and incremented as inserted in order.

  It returns an Ecto Query that is the combination
  of the inputted query and the cursor pagination.

  If an unknown or nil direction is inputted,
  it returns the original query in the default order.
  """
  @spec paginate(Ecto.Query.t, pos_integer, String.t) :: Ecto.Query.t
  def paginate(query, last_seen_id, direction)

  def paginate(query, last_seen_id, "prev") do
    query
    |> order_by(desc: ^cursor_id)
    |> where([q], field(q, ^cursor_id) < ^last_seen_id)
    |> limit(@per_page)
  end

  def paginate(query, last_seen_id, "next") do
    query
    |> order_by(asc: ^cursor_id)
    |> where([q], field(q, ^cursor_id) > ^last_seen_id)
    |> limit(@per_page)
  end

  def paginate(query, _, _) do
    query
    |> order_by(desc: ^cursor_id)
    |> limit(@per_page)
  end

  defp cursor_id, do: Application.fetch_env!(:ecto_cursor_pagination, :cursor_id)
end
