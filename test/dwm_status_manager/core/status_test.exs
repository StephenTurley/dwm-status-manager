defmodule DwmStatusManager.Core.StatusTest do
  use ExUnit.Case
  alias DwmStatusManager.Core.Status

  def processor(component) do
    "#{component.command} #{component.interval}"
  end

  def build_status do
    Status.new(delimeter: '|', processor: &processor/1)
  end

  def build_status(components) do
    Status.new(delimeter: '|', components: components, processor: &processor/1)
  end

  test "no components yeilds no status" do
    assert build_status() |> Status.to_string() == ""
  end
end
