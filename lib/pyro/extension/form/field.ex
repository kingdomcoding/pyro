if Code.ensure_loaded?(Ash) do
  defmodule Pyro.Resource.Form.Field do
    @moduledoc """
    The configuration of a form field in the `Pyro.Resource` extension.
    """
    defstruct [
      :name,
      :type,
      :label,
      :description,
      :path,
      :class,
      :input_class,
      :autofocus,
      :prompt,
      :autocomplete_search_action,
      :autocomplete_search_arg,
      :autocomplete_option_label_key,
      :autocomplete_option_value_key
    ]

    @type field_type :: :default | :long_text | :short_text | :autocomplete | :nested_form

    @type t :: %__MODULE__{
            name: atom(),
            type: field_type(),
            label: String.t(),
            description: String.t(),
            path: [atom()],
            class: String.t(),
            input_class: String.t(),
            autofocus: boolean(),
            prompt: String.t(),
            autocomplete_search_action: atom(),
            autocomplete_search_arg: atom(),
            autocomplete_option_label_key: atom(),
            autocomplete_option_value_key: atom()
          }

    @schema [
      name: [
        type: :atom,
        required: true,
        doc: "The name of the field to be modified"
      ],
      type: [
        type: {:in, [:default, :long_text, :short_text, :autocomplete, :nested_form]},
        required: false,
        doc: "The type of the value in the form.",
        default: :default
      ],
      label: [
        type: :string,
        required: false,
        doc: "Override the default extracted label."
      ],
      description: [
        type: :string,
        required: false,
        doc: "Override the default extracted description."
      ],
      class: [
        type: :string,
        required: false,
        doc: "Merge/override the default class."
      ],
      input_class: [
        type: :string,
        required: false,
        doc: "Merge/override the default input class."
      ],
      autofocus: [
        type: :boolean,
        required: false,
        default: false,
        doc: "Autofocus the field."
      ],
      prompt: [
        type: :string,
        required: false,
        doc: "Override the default prompt."
      ],
      path: [
        type: {:list, :atom},
        required: false,
        doc: "Override the default path (nested paths are appended)."
      ],
      autocomplete_search_action: [
        type: :atom,
        default: :autocomplete,
        doc: "Set the autocomplete search action name."
      ],
      autocomplete_search_arg: [
        type: :atom,
        default: :search,
        doc: "Set the autocomplete search argument key."
      ],
      autocomplete_option_label_key: [
        type: :atom,
        required: false,
        default: :label,
        doc: "Override the default autocomplete key used as a label."
      ],
      autocomplete_option_value_key: [
        type: :atom,
        required: false,
        default: :id,
        doc: "Override the default autocomplete key used as a value."
      ]
    ]

    def schema, do: @schema
  end
end
