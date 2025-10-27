Este script automatiza completamente la apertura del puerto 22 (usado por SSH) en sistemas Ubuntu cada vez que se inicia el ordenador. Es ideal para servidores o entornos donde el acceso remoto debe estar siempre disponible tras el arranque.
🚀 ¿Qué hace?

    Crea un script que habilita el firewall (ufw) y permite el puerto 22.

    Genera un servicio systemd que ejecuta ese script automáticamente al iniciar el sistema.

    Habilita el servicio para que se ejecute en cada arranque.
