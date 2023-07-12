# Use the official Elixir image
FROM hexpm/elixir:1.13.4-erlang-24.1.2-alpine-3.14.2

# Set the environment variables
ENV MIX_ENV=prod

# Install build tools (including make)
RUN apt-get update && \
    apt-get install -y build-essential

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
