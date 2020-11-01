## interface
### start / 0
create process
```elixir
def start(p_pid)
  pid = spawn(fn -> run(p_pid) end)
  pid
end
```

### job / 0
execute job
```elixir
def run(p_pid) do
  Proccesses.Job.run(p_pid)
end
```