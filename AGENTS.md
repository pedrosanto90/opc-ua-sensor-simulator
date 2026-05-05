# Repository Guidelines

This repository hosts an OPC UA simulation server written in Python that streams pump sensor data from a CSV dataset.

## Project Structure

- `opc-ua-server.py` — main server entry point (asyncua-based).
- `sensor.csv.zip` — compressed pump sensor dataset (extract to `sensor.csv`).
- `requirements.txt` — Python dependencies.
- `Dockerfile` / `docker-compose.yml` / `.dockerignore` — container setup.
- `README.md` — user-facing documentation.
- `LICENSE.md` — LGPL-3.0 license.

## Setup, Run & Docker

Local setup:

```bash
pip install -r requirements.txt
unzip sensor.csv.zip
python opc-ua-server.py
```

Configuration via environment variables: `OPCUA_HOST` (default `127.0.0.1`), `OPCUA_PORT` (default `4840`), `OPCUA_PATH` (default `/opcua/`), `SENSOR_CSV` (default `sensor.csv`).

Docker:

```bash
docker compose up --build
docker compose down
```

The server listens on `opc.tcp://localhost:4840/opcua/`.

## Coding Style

- Follow PEP 8 for Python code (4-space indents, snake_case for functions/variables).
- Prefer f-strings for interpolation.
- Keep imports grouped: stdlib, third-party, local.
- Use `os.environ.get` with sensible defaults for runtime configuration.

## Testing

There is no automated test suite. Validate changes manually by:

- `python3 -m py_compile opc-ua-server.py`
- Running the server and connecting with an OPC UA client (e.g. `opcua-client-gui`).
- For Docker changes, run `docker compose config` and `docker compose build`.

## Commits and Pull Requests

- Use short, imperative commit subjects (e.g. `Add Docker support`).
- Group related changes into a single commit when feasible.
- PRs should describe motivation, summarize changes, and note manual validation steps.
- Do not commit `.venv/`, extracted `sensor.csv`, `__pycache__/`, or other generated artifacts.

## Shell Commands

If `rtk` (Rust Token Killer) is available in the environment, prefix shell commands with `rtk` (e.g. `rtk git status`) to reduce token usage. Otherwise use the commands directly.
