defmodule DwmStatusManager.Boundary.StatusManager do
  alias DwmStatusManager.Core.Status
  use GenServer

  def init(status = %Status{}) do
    new_status =
      status
      |> Status.update_values(&process_component/1)
      |> send_status

    {:ok, new_status}
  end

  def handle_call({:update_value, index}, _from, status) do
    new_status =
      status
      |> Status.update_value(index, &process_component/1)
      |> send_status()

    {:reply, index, new_status}
  end

  defp send_status(status) do
    execute_command("xsetroot", ["-name", status.message])
    status
  end

  defp process_component(component) do
    with {msg, 0} <- execute_command(component.command, []) do
      msg
    else
      _ -> "Error!"
    end
  end

  defp execute_command(command, args) do
    System.cmd(command, args)
  end
end
