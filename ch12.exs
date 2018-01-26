defmodule FizzBuzz do
  # def upto(n) when n > 0, do: _upto(1, n, [])
  # defp _upto(_current, 0, result), do: Enum.reverse result
  # defp _upto(current, left, result) do
  #   next_answer = cond do
  #     rem(current, 3) === 0 and rem(current, 5) === 0 -> "FizzBuzz"
  #     rem(current, 3) === 0 -> "Fizz"
  #     rem(current, 5) === 0 -> "Buzz"
  #     true -> current
  #   end
  #   _upto(current+1, left-1, [ next_answer | result ])
  # end

  def upto(n) when(n > 0), do: _upto(1, n)
  defp _upto(cur, last) when(cur > last), do: []
  defp _upto(cur, last) do
    res = cond do
      rem(cur, 3) === 0 and rem(cur, 5) === 0 -> "FizzBuzz"
      rem(cur, 3) === 0 -> "Fizz"
      rem(cur, 5) === 0 -> "Buzz"
      true -> cur
    end
    [ res | _upto(cur+1, last)]
  end

  #ex 1
  def fizzbuzz(n) when(n > 0), do: _fizzbuzz(1, n)
  defp _fizzbuzz(cur, last) when(cur > last), do: []
  defp _fizzbuzz(cur, last) do
    res = case {rem(cur, 3), rem(cur, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> cur
    end
    [ res | _fizzbuzz(cur+1, last)]
  end

  #ex 3
  def ok!(val) do
    case val do
      {:ok, data} -> data
      _ -> raise "Error parsing #{val}"
    end
  end
end

defmodule Users do
  dave = %{ name: "Dave", state: "TX", likes: "programming", age: 27}
  case dave do
    %{state: some_state} = person -> IO.puts "#{person.name} lives in #{some_state}"
    person = %{age: age} when is_number(age) and age >= 21 -> IO.puts("You are cleared to enter the Foo Bar, #{person.name}")
    _ -> IO.puts "No matches"
  end
end