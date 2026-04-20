# Use official slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source
COPY app/ ./app/

# Cloud Run sets PORT env var; default to 8080
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Start uvicorn, binding to Cloud Run's dynamic PORT
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT}"]
