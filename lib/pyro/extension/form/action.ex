if Code.ensure_loaded?(Ash) do
  defmodule Pyro.Resource.Form.Action do
    @moduledoc """
    A group of form for action(s) in the `Pyro.Resource` extension.
    """
    defstruct [:name, :label, :description, :class, :fields]

    @schema [
      name: [
        type: {:or, [:atom, {:list, :atom}]},
        required: true,
        doc: "The action name(s) for this form."
      ],
      label: [
        type: :string,
        required: false,
        doc: "The label for this form."
      ],
      description: [
        type: :string,
        required: false,
        doc: "The description for this form."
      ],
      class: [
        type: :string,
        required: false,
        doc: "Merge/override the default class."
      ]
    ]

    def schema, do: @schema
  end
end
