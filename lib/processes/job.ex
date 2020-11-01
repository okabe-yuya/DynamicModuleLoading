defmodule Processes.Job do
  require Logger

  def run(p_pid, module_name) do
    send_nottify_mess(p_pid, self(), module_name)
    random_sleep()
    run(p_pid, module_name)
  end

  def send_nottify_mess(p_pid, pid, module_name) do
    send(p_pid, { :NOTIFICATION, pid, module_name})
  end

  def send_times_mess(p_pid, pid, module_name) do
    send(p_pid, { :TIMES, pid, module_name })
  end

  def random_sleep do
    Enum.random(1000..3000) |> :timer.sleep()
  end
end
