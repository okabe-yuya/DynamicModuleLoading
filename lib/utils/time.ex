defmodule Utils.Time do
  def local_now_time do
    {{year, month, date}, {hour, min, sec}} = :calendar.local_time()
    "#{year}/#{zero_padding(month)}/#{zero_padding(date)} #{zero_padding(hour)}:#{zero_padding(min)}:#{zero_padding(sec)}"
  end

  defp zero_padding(num), do: _zero_padding(div(num, 10), num)
  defp _zero_padding(0, num), do: "0#{num}"
  defp _zero_padding(div_resp, num) when div_resp > 0, do: num
end
