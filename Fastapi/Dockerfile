# ── Etapa 1: dependencias ──────────────────
FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ── Etapa 2: imagen final ──────────────────
FROM python:3.12-slim

# Usuario no-root (buena práctica de seguridad)
RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

# Copiar dependencias compiladas desde builder
COPY --from=builder /install /usr/local
COPY main.py .

USER appuser

# Puerto que expone la app
EXPOSE 8000

# --host 0.0.0.0 es OBLIGATORIO en contenedores
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]