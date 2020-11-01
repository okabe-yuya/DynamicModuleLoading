## interface
### start / 1
create process
```elixir
def start(p_pid)
  pid = spawn(fn -> run(p_pid) end)
  pid
end
```

### job / 1
execute job
```elixir
def run(p_pid) do
  Proccesses.Job.run(p_pid)
end
```