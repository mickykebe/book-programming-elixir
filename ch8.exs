defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(%Attendee{paid: paid, over_18: over_18}) do
    paid && over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end