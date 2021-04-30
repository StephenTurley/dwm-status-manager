defmodule DwmStatusManager do
  alias DwmStatusManager.Boundary.StatusServer
  alias DwmStatusManager.Boundary.ComponentUpdater
  alias DwmStatusManager.Config

  def start() do
    status = Config.status()
    {:ok, pid} = GenServer.start_link(StatusServer, status, name: StatusServer)
    start_updaters(status.components)
    {:ok, pid}
  end

  def update_component(index) do
    StatusServer.update_value(StatusServer, index)
  end

  defp start_updaters(components) do
    components
    |> Enum.with_index()
    |> Enum.each(fn {component, index} ->
      GenServer.start_link(ComponentUpdater, {index, component.interval})
    end)
  end
end
