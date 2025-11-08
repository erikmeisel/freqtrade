#!/bin/bash
# Script para ejecutar bot de trading intradía con altcoins

echo "🚀 Iniciando Bot de Trading Intradía - Altcoins"
echo "==============================================="

# Activar el entorno virtual
source .env/bin/activate

# Mostrar información del bot
echo "📊 Configuración:"
echo "  - Exchange: Bybit Futures"
echo "  - Timeframe: 5 minutos"
echo "  - Altcoins: SAND, MANA, AVAX"
echo "  - Estrategia: AnalisisAltcoins (Simple y efectiva)"
echo "  - Stake: 30 USDT por trade"
echo "  - Max trades: 8 simultáneos"
echo ""

# Configurar la estrategia que funciona
cp user_data/config_bybit_scalping.json user_data/config_intraday_live.json

# Cambiar a modo live (no dry_run)
sed -i 's/"dry_run": true/"dry_run": false/' user_data/config_intraday_live.json
sed -i 's/"strategy": ".*"/"strategy": "AnalisisAltcoins"/' user_data/config_intraday_live.json

echo "⚠️  ATENCIÓN: Este bot operará con dinero real!"
echo "  - Asegúrate de tener fondos suficientes en Bybit"
echo "  - El bot comenzará a operar automáticamente"
echo "  - Puedes detenerlo con Ctrl+C"
echo ""

read -p "¿Confirmas que quieres iniciar el trading en vivo? (y/N): " confirm

if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo ""
    echo "🎯 Iniciando trading en vivo..."
    echo "📈 Bot funcionando - Presiona Ctrl+C para detener"
    echo ""
    
    # Ejecutar el bot
    freqtrade trade --config user_data/config_intraday_live.json --verbosity 1
else
    echo ""
    echo "❌ Operación cancelada."
    echo "💡 Para probarlo en modo simulación:"
    echo "   freqtrade trade --config user_data/config_bybit_scalping.json"
fi

echo ""
echo "✅ Script terminado."