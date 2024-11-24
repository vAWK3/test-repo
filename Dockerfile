
    # Use an official Python runtime as a parent image
    FROM python:3.12-slim

    ENV PYTHONUNBUFFERED 1

    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    # Install cron and other necessary system packages
    RUN apt-get update && apt-get install -y cron gcc vim && apt-get clean

    # Create a virtual environment
    RUN python -m venv /py

    # Set environment variables
    ENV PYTHONPATH=/app:$PYTHONPATH

    # Install Python setuptools
    RUN /py/bin/pip install --upgrade pip setuptools

    # Copy the requirements file and install Python dependencies
    COPY ./requirements.txt /app/requirements.txt
    RUN /py/bin/pip install -r /app/requirements.txt

    # Copy the application source code
    COPY ./app /app

    # Set the working directory
    WORKDIR /app

    # Expose the port the app runs on
    EXPOSE 8000

    # Add and set permissions for the entrypoint script
    COPY start.sh /start.sh
    RUN chmod +x /start.sh

    # Add django-user with a home directory and add to sudoers for cron
    RUN adduser --disabled-password --no-create-home django-user
    ENV PATH="/py/bin:$PATH"

    # Switch to django-user
    USER django-user
    # Set the entrypoint script to be executed
    ENTRYPOINT ["/start.sh"]
    