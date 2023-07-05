# Use the official Elixir image as the base image
FROM elixir:1.13.4-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the necessary files to the container
COPY . .

# Install dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Generate and set the secret key
RUN mix deps.compile && \
    export SECRET_KEY_BASE=$(mix phx.gen.secret) && \
    echo "SECRET_KEY_BASE=$SECRET_KEY_BASE" >> .env

# Compile the application
RUN mix compile

# Run migrations and seed data
RUN mix ecto.migrate
RUN mix run priv/repo/seeds.exs

# Start the application
CMD ["mix", "phx.server"]
