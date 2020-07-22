```shell
iex[1]> import Increasly.Boundry
Increasly.Boundry
iex[2]> pid = start(42)
#PID<0.190.0>
iex[3]> send(pid, :inc)
:inc
iex[4]> Pro
Process     Protocol    
iex[4]> Process.alive? pid
true
iex[5]> send(pid, {:state, self()})
{:state, #PID<0.187.0>}
iex[6]> fl
floor/1    flush/0    
iex[6]> flush
flush/0    
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
iex[10]>
```
