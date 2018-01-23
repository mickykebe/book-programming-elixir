# won't work if the order of the two functions was reversed
# elixir matches against functions sequentially
defmodule Factorial do
  def of(0) do
    1
  end

  def of(n) when n > 0 do
    n * of(n-1)
  end
end

defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end
  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end
  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end

defmodule DefaultParams do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    [p1, p2, p3, p4]
  end
end

defmodule Exercises do
  # def double(n), do: n * 2
  def double(n) do
    n * 2
  end

  #ex 1
  def triple(n) do
    n * 3
  end

  #ex 3
  def quadruple(n) do
    double(double(n))
  end

  #ex 4
  def sum(1) do
    1
  end

  def sum(n) do
    n + sum(n-1)
  end

  #ex 5
  def gcd(x, 0) do
    x
  end
  
  def gcd(x, y) do
    gcd(y, rem(x, y))
  end
end

#ex 6
defmodule Chop do
  def guess(actual, first..last) do
    mid = rangeMiddle(first, last)
    guessNum(mid, actual, first..last)
  end

  defp guessNum(guess, actual, _range) when guess === actual do
    guess
  end

  defp guessNum(guess, actual, first..last) when actual < guess do
    IO.puts "Is it #{guess}"
    mid = rangeMiddle(first, guess)
    guessNum(mid, actual, first..guess)
  end

  defp guessNum(guess, actual, first..last) when actual > guess do
    IO.puts "Is it #{guess}"
    mid = rangeMiddle(guess, last)
    guessNum(mid, actual, guess..last)
  end

  defp rangeMiddle(first, last) do
    div(first + last, 2)
  end
end