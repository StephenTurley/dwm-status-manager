defmodule DwmStatusManager.Core.ComponentTest do
  use ExUnit.Case
  alias DwmStatusManager.Core.Component

  test "constructor" do
    result = Component.new(command: 'flerp', interval: 1_000)
    assert result == %Component{command: 'flerp', interval: 1_000}
  end
end
