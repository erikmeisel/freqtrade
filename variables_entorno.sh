# Variables de entorno para Freqtrade + Bybit
# Copia este archivo como .env y configura tus valores reales

# API Keys de Bybit (CAMBIAR POR TUS VALORES REALES)
export BYBIT_API_KEY="6vkDqS8RqtaEjDTIUq"
export BYBIT_SECRET="jN1NeyMz7nJI9AvqgbSnQ1IASxkGG3J3cUfR"

# Telegram (Opcional - descomenta y configura si quieres notificaciones)
# export TELEGRAM_TOKEN="tu_token_aqui"
# export TELEGRAM_CHAT_ID="tu_chat_id_aqui"

# Configuración de seguridad
export JWT_SECRET="$(openssl rand -base64 32)"
export WEB_PASSWORD="$(openssl rand -base64 12)"

echo "Variables de entorno configuradas:"
echo "- BYBIT_API_KEY: ${BYBIT_API_KEY:0:8}..."
echo "- BYBIT_SECRET: ${BYBIT_SECRET:0:8}..."
echo "- JWT_SECRET: Generado"
echo "- WEB_PASSWORD: $WEB_PASSWORD"
echo ""
echo "Para usar estas variables:"
echo "1. source variables_entorno.sh"
echo "2. Usa los archivos config_bybit_env.json que usan variables de entorno"