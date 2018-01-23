#ex: functions-2
fizzbuzz = fn 
  (0, 0, _c) -> "FizzBuzz"
  (0, _b, _c) -> "Fizz"
  (_a, 0, _c) -> "Buzz"
  (_a, _b, c) -> c
end

IO.puts fizzbuzz.(0, 0, 1)
IO.puts fizzbuzz.(0, 1, 1)
IO.puts fizzbuzz.(1, 0, 1)
IO.puts fizzbuzz.(1, 1, 1)

#ex: functions-3
rem_fizzbuzz = fn (n) -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end
IO.puts rem_fizzbuzz.(10)
IO.puts rem_fizzbuzz.(11)
IO.puts rem_fizzbuzz.(12)
IO.puts rem_fizzbuzz.(13)
IO.puts rem_fizzbuzz.(14)
IO.puts rem_fizzbuzz.(15)
IO.puts rem_fizzbuzz.(16)

#ex: function-4
prefix = fn pre -> (fn str -> "#{pre} #{str}" end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts(prefix.("Elixir").("Rocks"))

#ex: function-5
Enum.map [1,2,3,4], &(&1 + 2)
Enum.map [1,2,3,4], &(IO.inspect(&1))