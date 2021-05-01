# DwmStatusManager

A status manager for dwm built with elixir and inspired by [dwmblocks](https://github.com/torrinfail/dwmblocks)

## Installation

```
asdf plugin add elixir
asdf plugin add erlang
asdf install
```

## Configuration

The status bar is composed of `components` that are seperated by a `delimiter`. 

Each component has a `command` that is executed every `interval` in ms.

The command should be an executable on the `PATH` that returns the string status and a 0 exit code when successful.

modify the `config.ex` file:

```
  def status() do
    Status.new(delimiter: "|", components: components())
  end

  defp components() do
    [
      Component.new(command: "packages", interval: 60 * 60_000),
      Component.new(command: "crypto_prices", interval: 10 * 60_000),
      Component.new(command: "datestatus", interval: 10_000)
    ]
  end
```



## Run

#### TODO
