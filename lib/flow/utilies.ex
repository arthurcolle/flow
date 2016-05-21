defmodule Flow.Utilities do
  def format_utc_timestamp do
    ts = {_, _, micro} = :os.timestamp()
    {{y, mo, d}, {h, mi, s}} = :calendar.now_to_local_time(ts)
    str = :erlang.element(mo, {"Jan","Feb","Mar","Apr","May","Jun","Jul", "Aug","Sep","Oct","Nov","Dec"})
    :io_lib.format("~2w_~s_~4w_~2w:~2..0w:~2..0w.~6..0w~n", [d, str, y, h, mi, s, micro])
    |> to_string
    |> String.strip
  end

  def hashed_utc_timestamp do
    :crypto.hash(:sha256, format_utc_timestamp())
  end
end