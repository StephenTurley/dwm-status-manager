defmodule DwmStatusManager.Core.Component do
  defstruct ~w[command interval]a

  @doc "constructs a component"
  def new(fields) do
    struct!(__MODULE__, fields)
  end
end
