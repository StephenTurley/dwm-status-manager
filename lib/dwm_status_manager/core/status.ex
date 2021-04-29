defmodule DwmStatusManager.Core.Status do
  defstruct ~w[delimiter components values]a

  def new(fields) do
    struct!(__MODULE__, fields)
  end

  def to_string(status) do
    Enum.join(status.values, status.delimiter)
  end

  def update_values(status, processor) do
    Map.put(status, :values, Enum.map(status.components, processor))
  end

  def update_value(status, index, processor) do
    new_value = processor.(Enum.at(status.components, index))

    Map.put(status, :values, List.replace_at(status.values, index, new_value))
  end
end
