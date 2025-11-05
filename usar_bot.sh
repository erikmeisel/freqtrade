#!/bin/bash

echo "=== Guía de Uso de Freqtrade con Bybit ==="
echo ""
echo "Tu bot ya está configurado y listo para usar. Aquí tienes los comandos principales:"
echo ""

# Activar el entorno virtual
source .env/bin/activate

echo "1. VERIFICAR CONFIGURACIÓN:"
echo "   freqtrade show-config --config user_data/config_bybit.json"
echo ""

echo "2. DESCARGAR DATOS HISTÓRICOS (Recomendado antes de hacer backtesting):"
echo "   # Para los últimos 30 días:"
echo "   freqtrade download-data --config user_data/config_bybit.json --days 30 --timeframes 5m 1h"
echo "   # Para un rango específico:"
echo "   freqtrade download-data --config user_data/config_bybit.json --timerange 20241001-20241101"
echo ""

echo "3. HACER BACKTESTING (Probar estrategia con datos históricos):"
echo "   freqtrade backtesting --config user_data/config_bybit.json --timerange 20241001-20241101"
echo ""

echo "4. EJECUTAR EN MODO DRY-RUN (Simulación sin dinero real):"
echo "   freqtrade trade --config user_data/config_bybit.json"
echo ""

echo "5. EJECUTAR EN MODO REAL (Solo cuando estés seguro):"
echo "   # Primero cambiar 'dry_run': true a 'dry_run': false en la configuración"
echo "   freqtrade trade --config user_data/config_bybit.json"
echo ""

echo "6. PARA FUTUROS (si quieres hacer trading de futuros):"
echo "   freqtrade trade --config user_data/config_bybit_futures.json"
echo ""

echo "7. INTERFAZ WEB (Monitoreo del bot):"
echo "   # Inicia el servidor web en segundo plano:"
echo "   freqtrade webserver --config user_data/config_bybit.json"
echo "   # Luego abre http://localhost:8080 en tu navegador"
echo ""

echo "8. COMANDOS DE INFORMACIÓN:"
echo "   # Ver pares disponibles:"
echo "   freqtrade list-pairs --config user_data/config_bybit.json --quote USDT"
echo "   # Ver estrategias disponibles:"
echo "   freqtrade list-strategies"
echo "   # Ver timeframes soportados:"
echo "   freqtrade list-timeframes --config user_data/config_bybit.json"
echo ""

echo "ARCHIVOS DE CONFIGURACIÓN:"
echo "   - user_data/config_bybit.json       (Spot Trading - Ya configurado)"
echo "   - user_data/config_bybit_futures.json (Futures Trading - Ya configurado)"
echo ""

echo "IMPORTANTE:"
echo "   - El bot está en modo DRY-RUN (simulación) por defecto"
echo "   - Prueba siempre en dry-run antes de usar dinero real"
echo "   - Revisa los logs en user_data/logs/"
echo "   - Cambia las contraseñas por defecto de la interfaz web"
echo ""

echo "¿Qué quieres hacer ahora?"
echo "1) Descargar datos históricos"
echo "2) Hacer backtesting"
echo "3) Ejecutar en modo simulación"
echo "4) Abrir interfaz web"
echo "5) Ver configuración actual"
echo ""
read -p "Elige una opción (1-5): " opcion

case $opcion in
    1)
        echo "Descargando datos de los últimos 30 días..."
        freqtrade download-data --config user_data/config_bybit.json --days 30 --timeframes 5m 1h 4h
        ;;
    2)
        echo "Ejecutando backtesting con datos disponibles..."
        freqtrade backtesting --config user_data/config_bybit.json
        ;;
    3)
        echo "Iniciando bot en modo simulación..."
        echo "Presiona Ctrl+C para detener el bot"
        freqtrade trade --config user_data/config_bybit.json
        ;;
    4)
        echo "Iniciando interfaz web en http://localhost:8080"
        echo "Usuario: freqtrader"
        echo "Contraseña: CambiarPorPasswordSeguro123!"
        freqtrade webserver --config user_data/config_bybit.json
        ;;
    5)
        echo "Mostrando configuración actual:"
        freqtrade show-config --config user_data/config_bybit.json
        ;;
    *)
        echo "Opción no válida"
        ;;
esac