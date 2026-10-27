# Trabajo Práctico 1 – Base de Datos: Biblioteca Universitaria

Base de datos MySQL 8 levantada con Docker Compose.

## Estructura

```
├── docker-compose.yml   # Servicio MySQL
├── .env.example         # Plantilla de variables (copiar a .env)
├── sql/                 # Scripts que se ejecutan al iniciar el contenedor (en orden)
├── practica/            # Ejercicios y soluciones
└── doc/                 # Consignas y preguntas
```

## Cómo levantarlo

```bash
cp .env.example .env      # en Windows: copy .env.example .env
# editar .env y poner passwords propias
docker compose up -d
```

> Los scripts de `sql/` se ejecutan **solo la primera vez** (volumen vacío).
> Para reiniciar desde cero: `docker compose down -v && docker compose up -d`.

## Seguridad de datos y contraseñas

| Medida | Dónde |
|---|---|
| Las credenciales viven solo en `.env`, que **no se sube** | `.gitignore` |
| Se publica una plantilla sin valores reales | `.env.example` |
| `docker-compose.yml` solo referencia variables `${...}` | `docker-compose.yml` |
| Las passwords de `bibliotecario_user` y `admin_user` se leen de variables de entorno, no están escritas en el SQL | `sql/09_users_grants.sh` |
| El healthcheck lee la password dentro del contenedor (`$$`), así no queda expuesta en `docker inspect` | `docker-compose.yml` |
| Usuarios con **mínimo privilegio** (el bibliotecario solo lee catálogos y no puede borrar préstamos) | `sql/09_users_grants.sh` |
| Escaneo automático de secretos (Gitleaks) en cada push / PR | `.github/workflows/secret-scan.yml` |
| Los `.sh` se guardan con fin de línea LF para que funcionen en Linux | `.gitattributes` |

### Recomendaciones
- No reutilizar las passwords del `.env` en otros servicios.
- Si alguna vez se sube una credencial por error, **cambiarla de inmediato**: borrarla del archivo no la elimina del historial de Git.
- Activar en GitHub: *Settings → Code security → Secret scanning / Push protection*.
