# Use an official Python base image
FROM python:3.13.7-slim-trixie

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY TodoApp/requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy your FastAPI application code into the container
COPY . .

# Expose the port on which your FastAPI application will run
EXPOSE 8000

# Run the FastAPI application using Uvicorn
# Replace 'main:app' with your actual module and FastAPI app instance name
CMD ["uvicorn", "TodoApp.main:app", "--host", "0.0.0.0", "--port", "8000"]