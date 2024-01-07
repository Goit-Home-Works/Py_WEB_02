
# Use the official Python image as the base image
FROM python:3.11-slim

# Install build-essential for compilation
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy only the pyproject.toml file to the working directory
COPY pyproject.toml $APP_HOME/

# Install Poetry
RUN pip install poetry

# Generate poetry.lock inside the container
RUN poetry lock

# Install project dependencies
RUN poetry install --no-interaction --no-ansi

# Copy the entire project to the working directory
COPY . .


# Specify the command to run on container start
CMD ["poetry", "run", "python3", "__main__.py"]



