#!/bin/bash

# Verifica si se está ejecutando como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta como root (sudo)"
  exit 1
fi

# Ruta del script que abrirá el puerto
SCRIPT_PATH="/usr/local/bin/abrir_puerto_22.sh"

# Crear el script que abre el puerto 22
cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash
ufw enable
ufw allow 22
EOF

# Dar permisos de ejecución
chmod +x "$SCRIPT_PATH"

# Crear el servicio systemd
SERVICE_PATH="/etc/systemd/system/abrirpuerto22.service"

cat << EOF > "$SERVICE_PATH"
[Unit]
Description=Abrir puerto 22 al iniciar
After=network.target

[Service]
ExecStart=$SCRIPT_PATH
Type=oneshot
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

# Recargar systemd y habilitar el servicio
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable abrirpuerto22.service

echo "✅ Configuración completada. El puerto 22 se abrirá automáticamente al iniciar el sistema."
