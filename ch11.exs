defmodule Ch11 do
  #ex 1
  # def printable([]), do: true
  # def printable([head | tail]) when(head < 32 or head > 126), do: false
  # def printable([_h | tail]), do: printable(tail)


  def printable(list) do
    Enum.all?(list, &(&1 >= ?\s && &1 <= ?~ ))
  end
  #ex 2
  def anagram?(word1, word2) do
    word1 == Enum.reverse(word2)
  end

  #ex 4
  def calculate(eq) do
    _calc(eq, 0)
  end
  defp _calc([], prev), do: prev;
  defp _calc([head | tail], prev) when head >= ?0 and head <= ?9 do
    _calc(tail, prev * 10 + ( head - 48 ))
  end
  defp _calc([?+ | tail], prev) do
    prev + _calc(tail, 0)
  end
  defp _calc([?- | tail], prev) do
    prev - _calc(tail, 0)
  end
  defp _calc([?* | tail], prev) do
    prev * _calc(tail, 0)
  end
  defp _calc([?/ | tail], prev) do
    prev / _calc(tail, 0)
  end
  defp _calc([?\s | tail], prev) do
    _calc(tail, prev)
  end

  #ex 5
  def center(strList) do
    col_size = Enum.max_by(strList, &String.length/1)
      |> String.length
    Enum.map(strList, &(pad_str(&1, col_size)))
      |> Enum.each(&IO.puts/1)
  end

  def pad_str(str, col_size) do
    str_len = String.length(str)
    padding_space = col_size - str_len;
    pad_lead = str_len + div(padding_space, 2)
    pad_trail = col_size
    str
      |> String.pad_leading(pad_lead)
      |> String.pad_trailing(pad_trail)
  end

  #ex 6
  def capitalize_sentences(text) do
    String.split(text, ". ")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join(". ")
  end
end