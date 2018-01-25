defmodule Ch10 do
  
  #ex 5
  def all?(list, func \\ fn x -> x end)
  def all?([], _func), do: true
  def all?([head | tail], func) do
    func.(head) && all?(tail, func)
  end

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end
  
  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def take(list, amount) do
    _take(list, amount)
  end

  defp _take(_list, 0), do: []
  defp _take([], _amount), do: []
  defp _take([head | tail], amount) when(amount > 0) do
    [head | _take(tail, amount-1)]
  end

  #ex 6
  def flatten(val) when(not(is_list(val))), do: val
  def flatten([]), do: []
  def flatten([ head | tail]) when(is_list(head)) do
    flatten(head) ++ flatten(tail)
  end
  def flatten([ head | tail]) do
    [head | flatten(tail)]
  end

  #ex 7
  def primes(n) when(n > 2) do
    for x <- 2..n, !Enum.any?(2..x-1, &(rem(x, &1) === 0)), do: x
  end

  #ex 8
  def orders_with_total(orders, tax_rates) do
    Enum.map(orders, fn order -> with_total(order, tax_rates) end)
     
  end
  def with_total(order = [_id, {:ship_to, ship_dest}, net_amount: net_amount], tax_rates) when (ship_dest === :NC or ship_dest === :TX) do
    tax = tax_rates[ship_dest] * net_amount
    order ++ [{:total_amount, net_amount + tax }]
  end
  def with_total(order, _tax_rates), do: order
end