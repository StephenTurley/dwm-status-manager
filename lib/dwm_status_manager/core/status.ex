defmodule DwmStatusManager.Core.Status do
  defstruct ~w[delimiter components values processor]a

  def new(fields) do
    struct!(__MODULE__, fields)
    |> update_values()
  end

  def to_string(status) do
    Enum.join(status.values, status.delimiter)
  end

  def update_values(status) do
    status
    |> Map.put(:values, Enum.map(status.components, status.processor))
  end
end
