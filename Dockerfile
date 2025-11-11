# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3-slim

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Copy the local code to the container
WORKDIR /app
COPY . .

# Create environment variables
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# Unique command to run the application
CMD ["python", "my_app.py"]
