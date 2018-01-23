defmodule Times do
  # def double(n), do: n * 2
  def double(n) do
    n * 2
  end

  #ex 1
  def triple(n) do
    n * 3
  end

  #ex 2
  def quadruple(n) do
    double(double(n))
  end
end
