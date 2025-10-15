# Use an official Python runtime
FROM python:3.11-slim

# Create app directory
WORKDIR /code

# Install build deps then runtime deps (small image)
COPY requirements.txt /code/
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /code

# Set env (avoid buffered outputs) aam bekhteri3 a new env variable esma pythonbuffered de valeur 1
ENV PYTHONUNBUFFERED=1 

# Default port - can be overridden by docker-compose env
ENV APP_PORT=8000

# Run uvicorn. Note: module is app.app:app (repo root contains folder `app`)
# hon bi alli3 bas aamil  docker build 
# l container ha yetsama3 aa port 8000
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8000"]