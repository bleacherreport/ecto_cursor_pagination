defmodule Ecto.CursorPaginationTest do
  use ExUnit.Case

  test "#paginate - prev" do
    query  = %Ecto.Query{}
    result = Ecto.CursorPagination.paginate(query, 3, "prev")

    assert result.limit.expr                      == {:^, [], [0]}
    assert Enum.map(result.order_bys, &(&1.expr)) == [[desc: {{:., [], [{:&, [], [0]}, :id]}, [], []}]]
    assert Enum.map(result.wheres, &(&1.expr))    == [{:<, [], [{{:., [], [{:&, [], [0]}, :id]}, [], []}, {:^, [], [0]}]}]
    assert result.from                            == nil
  end

  test "#paginate - next" do
    query  = %Ecto.Query{}
    result = Ecto.CursorPagination.paginate(query, 3, "next")

    assert result.limit.expr                      == {:^, [], [0]}
    assert Enum.map(result.order_bys, &(&1.expr)) == [[asc: {{:., [], [{:&, [], [0]}, :id]}, [], []}]]
    assert Enum.map(result.wheres, &(&1.expr))    == [{:>, [], [{{:., [], [{:&, [], [0]}, :id]}, [], []}, {:^, [], [0]}]}]
    assert result.from                            == nil
  end

  test "#paginate - unknown direction" do
    query  = %Ecto.Query{}
    result = Ecto.CursorPagination.paginate(query, 3, "unknown")

    assert result.limit.expr                      == {:^, [], [0]}
    assert Enum.map(result.order_bys, &(&1.expr)) == [[desc: {{:., [], [{:&, [], [0]}, :id]}, [], []}]]
    assert Enum.map(result.wheres, &(&1.expr))    == []
    assert result.from                            == nil
  end
end
