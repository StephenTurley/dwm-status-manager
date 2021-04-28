defmodule DwmStatusManager.Core.Status do
  defstruct ~w[delimeter components values processor]a

  def new(fields) do
    struct!(
      __MODULE__,
      fields
      |> Keyword.put(:components, [])
      |> Keyword.put(:values, [])
    )
  end

  def to_string(status) do
    Enum.map_join(status.values, status.delimeter)
  end
end
