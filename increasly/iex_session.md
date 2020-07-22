# IEx Sessions
It use for archived our code to grab from iex.

## Creating a module to spawn a process and listening the receive messages
```elixir
iex[1]> import Increasly.Boundry
Increasly.Boundry
iex[2]> pid = start(42)
#PID<0.190.0>
iex[3]> send(pid, :inc)
:inc
iex[4]> Process.alive?(pid)
true
iex[5]> send(pid, {:state, self()})
{:state, #PID<0.187.0>}
iex[6]> flush
43
:ok
iex[7]> send(pid, :inc)            
:inc
iex[8]> send(pid, {:state, self()})
{:state, #PID<0.187.0>}
iex[9]> flush                      
44
:ok
```

## Creating our generic server
```elixir
iex(2)> GenServer.start_link(Increasly.Server, 42)
{:ok, #PID<0.147.0>}
iex(3)> {:ok, counter} = v(2)
{:ok, #PID<0.147.0>}
iex(4)> counter
#PID<0.147.0>
iex(5)> GenServer.cast(counter, :inc)
:ok
iex(6)> GenServer.call(counter, state)
** (CompileError) iex:6: undefined function state/0
    (stdlib 3.13) lists.erl:1354: :lists.mapfoldl/3
    (stdlib 3.13) lists.erl:1355: :lists.mapfoldl/3
iex(6)> GenServer.call(counter, :state)
43
iex(7)> GenServer.cast(counter, :inc)
:ok
iex(8)> GenServer.cast(counter, :inc)
:ok
iex(9)> GenServer.cast(counter, :inc)
:ok
iex(10)> GenServer.call(counter, :state)
46
iex(11)> GenServer.cast(counter, :dec)
:ok
iex(12)> GenServer.call(counter, :state)
45
```

# User a GenServer OTP module and user the Supervisor to start our children
```elixir
iex[1]> Process.alive?(GenServer.whereis(:server))
true
iex[2]> Increasly.inc
:ok
iex[3]> Increasly.inc
:ok
iex[4]> Increasly.dec
:ok
iex[5]> Increasly.state
43
```
