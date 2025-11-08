#!/bin/bash
# Script para iniciar Freqtrade con interfaz web

echo "🌐 Iniciando Freqtrade con Interfaz Web"
echo "======================================="

# Cambiar al directorio de Freqtrade
cd /mnt/zonadatos/zona_zoftware/freqtrade

# Activar entorno virtual
source .env/bin/activate

echo "📊 Configuración de la Web UI:"
echo "  - URL: http://localhost:8080"
echo "  - Usuario: admin"
echo "  - Password: admin123"
echo "  - Exchange: Bybit Futures"
echo "  - Modo: Simulación (dry_run=true)"
echo ""

# Función para limpiar al salir
cleanup() {
    echo ""
    echo "🛑 Deteniendo servicios..."
    jobs -p | xargs -r kill
    exit 0
}

# Configurar trap para limpiar al salir
trap cleanup INT TERM

# Iniciar Freqtrade con API habilitada
echo "🚀 Iniciando Freqtrade..."
freqtrade trade --config user_data/config_webui.json &
FREQTRADE_PID=$!

# Esperar un poco para que Freqtrade inicie
sleep 5

# Verificar si FreqUI está instalado
if [ ! -d "frequi/node_modules" ]; then
    echo "📦 Instalando FreqUI por primera vez..."
    cd frequi && npm install && cd ..
fi

# Iniciar FreqUI
echo "🎨 Iniciando interfaz web FreqUI..."
cd frequi
npm run serve &
FREQUI_PID=$!
cd ..

echo ""
echo "✅ Servicios iniciados:"
echo "  🤖 Freqtrade Bot: PID $FREQTRADE_PID"
echo "  🌐 Interfaz Web: PID $FREQUI_PID"
echo ""
echo "🌍 Accede a la interfaz web en:"
echo "  👉 http://localhost:8080 (FreqUI)"
echo "  👉 http://localhost:8080/api/v1/ping (API direct)"
echo ""
echo "📝 Credenciales:"
echo "  Usuario: admin"
echo "  Password: admin123"
echo ""
echo "⏹️  Presiona Ctrl+C para detener ambos servicios"

# Esperar a que termine
wait $FREQTRADE_PID $FREQUI_PID