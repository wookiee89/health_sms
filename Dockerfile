# Use an official Python runtime as a parent image
FROM python:3.11.0-slim-buster

# Set environment variables for Python to run in unbuffered mode
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy the Poetry lock and pyproject.toml files and install dependencies
COPY pyproject.toml poetry.lock /app/
RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port on which your FastAPI application runs (default is 8000)
EXPOSE 8000

# Start the FastAPI application using Uvicorn
CMD ["uvicorn", "asgi:api", "--host", "0.0.0.0", "--port", "8000", "--reload"]
