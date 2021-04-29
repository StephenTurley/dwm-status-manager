defmodule DwmStatusManager.Core.Status do
  defstruct ~w[delimiter components values message]a

  def new(fields) do
    struct!(__MODULE__, fields |> Keyword.put(:message, ""))
  end

  def update_values(status, processor) do
    status
    |> Map.put(:values, Enum.map(status.components, processor))
    |> compute_message()
  end

  def update_value(status, index, processor) do
    new_value = processor.(Enum.at(status.components, index))

    status
    |> Map.put(:values, List.replace_at(status.values, index, new_value))
    |> compute_message()
  end

  defp compute_message(status) do
    Map.put(status, :message, Enum.join(status.values, status.delimiter))
  end
end
