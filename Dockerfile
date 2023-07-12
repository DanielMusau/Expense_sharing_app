# Use the official Elixir image
FROM hexpm/elixir:1.11.2-erlang-23.2.1-alpine-3.12.1

# Set the environment variables
ENV MIX_ENV=prod

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Install mix dependencies
RUN mix deps.get

# Compile the application
RUN mix compile

# Run database migrations (if applicable)
# RUN mix ecto.migrate

# Build the release
RUN mix release

# Expose the necessary port (if applicable)
# EXPOSE <port>

# Set the entrypoint command for the release
CMD ["./_build/prod/rel/expense_sharing_app/bin/expense_sharing_app", "start"]
