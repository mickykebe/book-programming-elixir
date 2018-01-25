defmodule Ch10Test do
  use ExUnit.Case
  doctest Ch10

  test "all? success case" do
    assert Ch10.all?([2, 4, 6], &(rem(&1, 2) === 0))
  end

  test "all? failure case" do
    refute Ch10.all?([2, 3, 4], &(rem(&1, 2) === 0))
  end

  test "all? truthy check true" do
    assert Ch10.all?([1, 2, 3])
  end

  test "all? truthy check false" do
    refute Ch10.all?([1, nil, 3])
  end

  test "filter standard case" do
    assert Ch10.filter([1, 2, 3], &(rem(&1, 2) === 0)) === [2]
  end

  test "flatten" do
    assert Ch10.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]]) === [1, 2, 3, 4, 5, 6]
  end
end
