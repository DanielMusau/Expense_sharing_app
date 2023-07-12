# Use the elixir:1.12.2-alpine image as the base
FROM elixir:1.12.2-alpine

# Install build tools
RUN apk add --update build-base

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Install mix dependencies
RUN mix deps.get

# Compile the application
RUN mix compile

# Run the application
CMD ["mix", "phx.server"]