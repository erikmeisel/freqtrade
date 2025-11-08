#!/bin/bash

echo "=== Configuración de Freqtrade para Bybit ==="
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "freqtrade/__init__.py" ]; then
    echo "Error: No se encuentra el directorio de Freqtrade. Ejecutar desde la raíz del proyecto."
    exit 1
fi

# Crear directorios necesarios
echo "Creando directorios de usuario..."
mkdir -p user_data/{data,logs,notebooks,plot,strategies}

# Instalar dependencias si es necesario
echo "Verificando instalación de Python y dependencias..."
if ! command -v python3 &> /dev/null; then
    echo "Python3 no está instalado. Por favor, instálalo primero."
    exit 1
fi

# Verificar si el entorno virtual existe
if [ ! -d ".env" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv .env
fi

echo "Activando entorno virtual..."
source .env/bin/activate

# Instalar freqtrade si no está instalado
if ! command -v freqtrade &> /dev/null; then
    echo "Instalando Freqtrade..."
    pip install --upgrade pip
    pip install -e .
    
    # Instalar dependencias adicionales
    pip install -r requirements.txt
fi

echo ""
echo "=== Configuración completada ==="
echo ""
echo "Archivos de configuración creados:"
echo "  - user_data/config_bybit.json (Trading Spot)"
echo "  - user_data/config_bybit_futures.json (Trading Futuros)"
echo ""
echo "IMPORTANTE: Antes de usar el bot, debes:"
echo "1. Obtener las claves API de Bybit:"
echo "   - Ve a Bybit → API Management"
echo "   - Crea una nueva API Key con permisos de trading"
echo "   - Para SPOT: necesitas permisos 'Spot Trading'"
echo "   - Para FUTURES: necesitas 'Contract - Orders' y 'Contract - Positions'"
echo ""
echo "2. Editar la configuración:"
echo "   - Reemplaza 'tu_api_key_de_bybit' con tu API Key real"
echo "   - Reemplaza 'tu_secret_de_bybit' con tu Secret real"
echo "   - Cambia 'dry_run': true a false cuando estés listo para trading real"
echo ""
echo "3. Configurar Telegram (opcional):"
echo "   - Crea un bot en Telegram con @BotFather"
echo "   - Reemplaza 'tu_token_de_telegram' y 'tu_chat_id_de_telegram'"
echo "   - Cambia 'enabled': false a true"
echo ""
echo "Comandos útiles:"
echo "  freqtrade trade --config user_data/config_bybit.json"
echo "  freqtrade backtesting --config user_data/config_bybit.json"
echo "  freqtrade download-data --config user_data/config_bybit.json --timerange 20231101-"
echo ""