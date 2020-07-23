# IEx Sessions
It use for archived our code to grab from iex.

## Testing the Game API - Take only 9 turns - Testing the playing status
```elixir
iex[1]> import Overlord.Game
Overlord.Game
iex[2]> guesses = Stream.repeatedly(fn -> [1,2,3,3] end) |> Enum.take(9)
[
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3]
]
iex[3]> gaming = Enum.reduce(guesses, new([1,2,3,4]), fn g, game -> guess(game, g) end)
%Overlord.Game{
  answer: [1, 2, 3, 4],
  guesses: [
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3]
  ]
}
iex[4]> info(gaming)  
%{
  moves: [
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}}
  ],
  status: :playing
}
```

## Testing the Game API - Take only 10 turns - Testing the lost status
```elixir
iex[1]> import Overlord.Game
Overlord.Game
iex[2]> guesses = Stream.repeatedly(fn -> [1,2,3,3] end) |> Enum.take(10)
[
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3],
  [1, 2, 3, 3]
]
iex[3]> gaming = Enum.reduce(guesses, new([1,2,3,4]), fn g, game -> guess(game, g) end)
%Overlord.Game{
  answer: [1, 2, 3, 4],
  guesses: [
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3],
    [1, 2, 3, 3]
  ]
}
iex[4]> info(gaming)  
%{
  moves: [
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}},
    %{guess: [1, 2, 3, 3], score: %{reds: 3, whites: 0}}
  ],
  status: :lost
}
```
