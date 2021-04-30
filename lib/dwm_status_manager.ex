defmodule DwmStatusManager do
  alias DwmStatusManager.Boundary.StatusServer
  alias DwmStatusManager.Config

  def start() do
    GenServer.start_link(StatusServer, Config.status(), name: StatusServer)
  end

  def update_component(index) do
    StatusServer.update_value(StatusServer, index)
  end
end
