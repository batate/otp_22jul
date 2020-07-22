defmodule Increasly.Core do 

  def up(x), do: add(x, 1)

  def down(x), do: add(x, -1)    

  def counter(num) when is_integer(num) do
    num
  end

  def add(acc, num) do
    acc + num
  end

  def fold(list, fun) do
    Enum.reduce(list, fn(item, acc) -> fun.(acc, item) end)
  end
end
