# Exercise 4: Python application with Redis

The application increments a Redis counter on every request. The Dockerfile
builds the Python service, while `docker-compose.yml` starts it beside Redis.

```powershell
docker compose config
docker compose up --build
curl http://127.0.0.1:8000/
docker compose down
```

Docker is not installed on this Windows machine, so the files were prepared and
checked as text but the containers were not started. Run the commands above on
a machine with Docker Desktop to complete the runtime verification.
