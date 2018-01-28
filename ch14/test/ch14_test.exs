defmodule Ch14Test do
  use ExUnit.Case
  doctest Ch14

  setup do
    [
      list: [1, 3, 5, 7, 9, 11],
      sum: 36,
      count: 6
    ]
  end

  describe "Stats on lists of ints" do
    test "calculates sum", fixture do
      assert Ch14.sum(fixture.list) == fixture.sum
    end

    test "calculates count", fixture do
      assert Ch14.count(fixture.list) == fixture.count
    end

    test "calculates average", fixture do
      assert Ch14.average(fixture.list) == fixture.sum / fixture.count
    end
  end
end
