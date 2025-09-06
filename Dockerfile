# Use an official Python runtime as a parent image
FROM python:3.12-alpine

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt first to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY src/ .

# Expose the port Flask runs on (optional, e.g., 5000)
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]