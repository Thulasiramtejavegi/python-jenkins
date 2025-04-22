FROM python:3.9-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .
COPY templates/ ./templates/


# Set environment variables
ENV DB_HOST=postgres
ENV DB_NAME=userdb
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres

# Expose the port the app runs on
EXPOSE 5001 

# Start the application
CMD ["python", "app.py"]
