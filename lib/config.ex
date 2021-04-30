defmodule DwmStatusManager.Config do
  alias DwmStatusManager.Core.Component
  alias DwmStatusManager.Core.Status

  def status() do
    Status.new(delimiter: "|", components: components())
  end

  defp components() do
    [
      Component.new(command: "datestatus", interval: 60_000)
    ]
  end
end
