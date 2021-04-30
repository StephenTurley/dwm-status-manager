defmodule DwmStatusManager.Boundary.ComponentUpdater do
  use GenServer

  def init({index, interval}) do
    schedule_update(interval)
    {:ok, {index, interval}}
  end

  def handle_info(:update, {index, interval}) do
    DwmStatusManager.update_component(index)
    {:noreply, {index, interval}}
  end

  defp schedule_update(interval) do
    Process.send_after(self(), :update, interval)
  end
end
