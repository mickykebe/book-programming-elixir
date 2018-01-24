defmodule MyList do
  def len([]) do
    0
  end
  def len([_head | tail]) do
    1 + len(tail)
  end

  def square([]) do
    []
  end
  def square([head | tail]) do
    [ head * head | square(tail)]
  end

  def map([], _func), do: []
  def map([ head | tail], func) do
    [ func.(head) | map(tail, func) ]
  end

  def reduce([], _func, total), do: total
  def reduce([ head | tail], func, total) do
    reduce(tail, func, func.(head, total))
  end

  #ex 0
  def sum([]), do: 0
  def sum([ head | tail]), do: head + sum(tail)

  #ex 1
  def mapsum(list, func) do
    list
    |> map(func)
    |> reduce(&(&1 + &2), 0)
  end

  #ex 2
  def max([head | tail]) do
    _max(tail, head)
  end

  defp _max([], n), do: n
  defp _max([head | tail], n) when n > head do
    _max(tail, n)
  end
  defp _max([head | tail], n) when n < head do
    _max(tail, head)
  end

  #ex 3
  def caesar([], n), do: []
  def caesar([ head | tail], n) do
    [ rem(head + n, 122) | caesar(tail, n) ]
  end

  #ex 4
  def span(to, to), do: [to]
  def span(from, to) when from < to do
    [from | span(from+1, to)]
  end
  def span(from, to) when from > to do
    raise "from must be less than to"
  end
end

defmodule Swapper do
  def swap([]), do: []
  def swap([ a, b | tail ]), do: [ b, a | swap(tail)]
  def swap([_]), do: raise "Can't swap a list with an odd number of elements"
end

defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([ [time, 27, temp, rain ] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end
  def for_location_27([ _ | tail]), do: for_location_27(tail)

  def test_data do
    [
      [1366225622, 26, 15, 0.125],
      [1366225622, 27, 15, 0.45],
      [1366225622, 28, 21, 0.25],
      [1366229222, 26, 19, 0.081],
      [1366229222, 27, 17, 0.468],
      [1366229222, 28, 15, 0.60],
      [1366232822, 26, 22, 0.095],
      [1366232822, 27, 21, 0.05],
      [1366232822, 28, 24, 0.03],
      [1366236422, 26, 17, 0.025]
    ]
  end

  def for_location([], target_loc), do: []
  def for_location([ head = [_, target_loc, _, _ ] | tail], target_loc) do
    [head | for_location(tail, target_loc)]
  end
  def for_location([ _ | tail], target_loc), do: for_location(tail, target_loc)
end