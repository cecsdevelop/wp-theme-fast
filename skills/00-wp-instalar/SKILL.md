---
name: wp-instalar
description: Instala un WordPress local nuevo en MAMP - descarga WordPress, crea la carpeta en htdocs, crea la base de datos utf8mb4 y guía el instalador web con prefijo de tablas propio y WP_DEBUG activo. Usar al iniciar el curso de theme desde cero o al montar un sitio de desarrollo. Episodio 0, primera mitad.
---

# Episodio 0: instalar WordPress

Entradas: `NOMBRE-SITIO` (minúsculas, números y guiones). Entorno: MAMP en macOS, Apache en 8888, MySQL en 8889, MAMP encendido.

## Flujo

1. **Descarga, carpeta y BD:** `scripts/setup-wp.sh NOMBRE-SITIO`. Se niega a correr si la carpeta ya existe. Credenciales por variables de entorno (`DB_USER`, `DB_PASS`, `DB_PORT`), nunca escritas en el script.
2. **Instalador web (manual):** DETENERSE aquí. El usuario abre `http://localhost:8888/NOMBRE-SITIO` y completa el formulario: nombre de la BD, usuario y clave de MAMP, host `localhost` y un **prefijo de tablas distinto de `wp_`** (por ejemplo `nt_`). Después crea el administrador con una clave que no sea `admin`. No automatizar este paso: se muestra en el video y las claves son del usuario.
3. **wp-config.php:** cuando el instalador termine, poner `WP_DEBUG` en `true`.

## Verificación

- `http://localhost:8888/NOMBRE-SITIO/wp-login.php` responde 200.
- `wp-config.php` tiene el prefijo elegido y `WP_DEBUG` en `true`.

## Siguiente

Skill `theme-minimo`; la limpieza (`wp-limpio`) va después, con el theme propio ya activo.

## Reglas

- No modificar sitios existentes: si la carpeta ya existe, detenerse.
- No escribir ni repetir contraseñas del usuario.
- Es un entorno local; las credenciales por defecto de MAMP no se usan fuera de él.
