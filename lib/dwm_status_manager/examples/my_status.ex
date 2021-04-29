defmodule DwmStatusManager.Examples.MyStatus do
  alias DwmStatusManager.Core.Status
  alias DwmStatusManager.Core.Component

  def build_status() do
    Status.new(
      delimiter: "|",
      components: [
        Component.new(command: "datestatus", interval: 60_000)
      ]
    )
  end
end
