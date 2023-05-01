defmodule Mix.Tasks.Compile.Pyro.AssetGenerator do
  @moduledoc false

  use Mix.Task

  @doc false
  def run(_args) do
    css_file =
      Application.get_env(
        :pyro,
        :css_file,
        Path.join(File.cwd!(), "assets/css/pyro.css")
      )

    global_style =
      "/* ### GLOBAL STYLE ### */\n\n" <>
        (Pyro.Overrides.global_style() || "/* No `global_style` specified in overrides. */") <>
        "\n"

    css =
      "/* ### THIS FILE IS AUTOMATICALLY GENERATED BY PYRO -- DO NOT EDIT DIRECTLY! */\n\n" <>
        global_style <> Pyro.Makeup.Style.stylesheet()

    Enum.each(
      [
        {css_file, css}
      ],
      fn
        {file, new_contents} ->
          with {:ok, old_contents} <- File.read(file),
               true <- !!(new_contents == old_contents) do
          else
            _ ->
              File.write!(file, new_contents)
          end
      end
    )

    :ok
  end
end
