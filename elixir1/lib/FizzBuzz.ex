defmodule FizzBuzz do
  defp fizz_buzz(0,0,_third), do: "FizzBuzz"
  defp fizz_buzz(0,_,_third), do: "Fizz"
  defp fizz_buzz(_,0,_third), do: "Buzz"
  defp fizz_buzz(_,_,third), do: third


  def fizz_buzz(low..high//step) do
    Enum.map(low..high//step, &(FizzBuzz.fizz_buzz(&1)))
  end

  def fizz_buzz(n) do
    fizz_buzz(rem(n,3), rem(n,5), n)
  end

end

defmodule FizzBuzz2 do
  def fizz_buzz(low..high//step) do
    Enum.map(low..high//step, &(FizzBuzz.fizz_buzz(&1)))
  end
end
