# Start with a base Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install system dependencies and Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port Streamlit runs on
EXPOSE 8501

# Command to run the Streamlit application
CMD ["streamlit", "run", "homepage.py", "--server.port=8501", "--server.address=0.0.0.0"]