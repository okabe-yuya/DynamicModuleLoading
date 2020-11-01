defmodule Processes.Parent do
  require Logger

  def start do
    spawn(fn -> receive_mess() end)
  end

  defp receive_mess do
    receive do
      { :NOTIFICATION, c_pid, module_name } ->
        Logger.info("(′・ω・`) Received message from #{template_mess(c_pid, module_name)}")
        receive_mess()
      { :TIMES, c_pid, module_name } ->
        Logger.info("🐓⏰ => #{Utils.Time.local_now_time()} from #{template_mess(c_pid, module_name)}")
        receive_mess()
      { _, c_pid, module_name } ->
        Logger.error("Received unallowed message from #{template_mess(c_pid, module_name)}")
        raise "unallowd_message"
      _ ->
        Logger.error("Panic erorr!! :: Not expected message passing!")
    end
  end

  defp template_mess(c_pid, module_name) do
    "#{inspect(c_pid)} as #{module_name}"
  end
end
