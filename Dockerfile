FROM python:alpine

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Add a non-root user and switch to it
RUN adduser -D myuser
USER myuser

# Expose the port the app runs on
EXPOSE 80

# Run the application
CMD ["python", "./bookstore-api.py"]
