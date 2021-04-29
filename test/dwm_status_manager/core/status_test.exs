defmodule DwmStatusManager.Core.StatusTest do
  use ExUnit.Case
  alias DwmStatusManager.Core.Status
  alias DwmStatusManager.Core.Component

  defp processor(component) do
    "#{component.command} #{component.interval}"
  end

  defp build_status(components) do
    Status.new(delimiter: "|", components: components)
  end

  test "no components yeilds no status" do
    assert build_status([])
           |> Status.update_values(&processor/1)
           |> Map.get(:message) == ""
  end

  test "it builds a single component" do
    component = Component.new(command: "flerpn", interval: 500)

    result =
      build_status([component])
      |> Status.update_values(&processor/1)

    assert result.message == "flerpn 500"
  end

  test "it builds multiple components" do
    components = [
      Component.new(command: "flerpn", interval: 500),
      Component.new(command: "derpn", interval: 10_000),
      Component.new(command: "herpn", interval: 1_000)
    ]

    result =
      build_status(components)
      |> Status.update_values(&processor/1)
      |> Map.get(:message)

    assert result == "flerpn 500|derpn 10000|herpn 1000"
  end

  test "it can update individual components" do
    initial = fn _component -> "not updated" end
    updated = fn _component -> "Updated!" end

    components = [
      Component.new(command: "flerpn", interval: 500),
      Component.new(command: "derpn", interval: 10_000),
      Component.new(command: "herpn", interval: 1_000)
    ]

    result =
      build_status(components)
      |> Status.update_values(initial)
      |> Status.update_value(1, updated)
      |> Map.get(:message)

    assert result == "not updated|Updated!|not updated"
  end
end
