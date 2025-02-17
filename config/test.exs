import Config

# config :pyro, ComponentPreviewer.Endpoint,
#   http: [ip: {127, 0, 0, 1}, port: 4002],
#   secret_key_base: "4t1mF8thWqNlx0ZpVKLcOJseDqKkptl7oOi0yBrqpDnKyNW9JBO+IZ5HBHdfOk4x",
#   server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :pyro, :overrides, [Pyro.Overrides.Testing, Pyro.Overrides.Default]
config :ash, :use_all_identities_in_manage_relationship?, false
