#!/bin/bash

# Script para usar el bot de futuros de Bybit
# Ejecutar: bash usar_bot_futuros.sh

echo "🚀 Bot de Futuros Bybit - Menú Principal"
echo "======================================="
echo ""

# Activar entorno virtual
source .env/bin/activate

echo "1. Dry Run (Simulación segura) - RECOMENDADO"
echo "2. Live Trading (Trading real con dinero real)"
echo "3. Backtesting (Probar estrategia)"
echo "4. Ver UI (Interfaz web)"
echo "5. Descargar más datos"
echo "6. Salir"
echo ""

read -p "Elige una opción (1-6): " opcion

case $opcion in
    1)
        echo "🟢 Iniciando bot en modo DRY RUN (simulación)..."
        echo "✅ Esto es 100% seguro, no usa dinero real"
        freqtrade trade --config user_data/config_bybit_futures.json
        ;;
    2)
        echo "🔴 ADVERTENCIA: Esto usa dinero real!"
        read -p "¿Estás seguro? Escribe 'SI' para continuar: " confirmacion
        if [ "$confirmacion" = "SI" ]; then
            echo "Cambiando a modo LIVE..."
            sed -i 's/"dry_run": true/"dry_run": false/' user_data/config_bybit_futures.json
            freqtrade trade --config user_data/config_bybit_futures.json
        else
            echo "Cancelado. Volviendo al menú..."
        fi
        ;;
    3)
        echo "📊 Ejecutando backtesting..."
        freqtrade backtesting --config user_data/config_bybit_futures.json
        ;;
    4)
        echo "🌐 Abriendo UI en http://localhost:8081"
        echo "Usuario: freqtrader"
        echo "Contraseña: CambiarPorPasswordSeguro123!"
        freqtrade webserver --config user_data/config_bybit_futures.json &
        sleep 3
        echo "UI iniciada. Abre http://localhost:8081 en tu navegador"
        ;;
    5)
        echo "⬇️ Descargando datos adicionales..."
        freqtrade download-data --exchange bybit --pairs BTC/USDT:USDT ETH/USDT:USDT BNB/USDT:USDT ADA/USDT:USDT DOT/USDT:USDT LINK/USDT:USDT UNI/USDT:USDT LTC/USDT:USDT BCH/USDT:USDT XRP/USDT:USDT --timeframes 1h 4h 1d --days 90 --trading-mode futures --config user_data/config_bybit_futures.json
        echo "✅ Datos descargados"
        ;;
    6)
        echo "👋 ¡Hasta luego!"
        exit 0
        ;;
    *)
        echo "❌ Opción inválida"
        ;;
esac