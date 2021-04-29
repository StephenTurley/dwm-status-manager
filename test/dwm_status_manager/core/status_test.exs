defmodule DwmStatusManager.Core.StatusTest do
  use ExUnit.Case
  alias DwmStatusManager.Core.Status
  alias DwmStatusManager.Core.Component

  defp processor(component) do
    "#{component.command} #{component.interval}"
  end

  defp build_status(components) do
    Status.new(delimiter: "|", components: components, processor: &processor/1)
  end

  test "no components yeilds no status" do
    assert build_status([]) |> Status.to_string() == ""
  end

  test "it builds a single component" do
    component = Component.new(command: "flerpn", interval: 500)

    result =
      build_status([component])
      |> Status.to_string()

    assert result == "flerpn 500"
  end

  test "it builds multiple components" do
    components = [
      Component.new(command: "flerpn", interval: 500),
      Component.new(command: "derpn", interval: 10_000),
      Component.new(command: "herpn", interval: 1_000)
    ]

    result =
      build_status(components)
      |> Status.to_string()

    assert result == "flerpn 500|derpn 10000|herpn 1000"
  end
end
