# 🌐 **Guía Completa: Interfaz Web de Freqtrade**

## 🚀 **Cómo Iniciar la Interfaz Web**

### **Opción 1: Script Automático**
```bash
./iniciar_webui.sh
```

### **Opción 2: Manual**
```bash
source .env/bin/activate
freqtrade trade --config user_data/config_webui_simple.json
```

## 🔐 **Acceso a la Interfaz Web**

### **URLs de Acceso:**
- **Interfaz Principal**: http://localhost:8080
- **API Directa**: http://localhost:8080/api/v1/
- **Documentación API**: http://localhost:8080/docs

### **Credenciales de Login:**
### Credenciales de acceso:
- **Usuario**: admin
- **Contraseña**: 1234

## 📊 **Funcionalidades de la Web UI**

### **1. Dashboard Principal**
- **Estado del Bot**: Running/Stopped
- **Balance Total**: Saldo disponible y en trades
- **Trades Activos**: Lista de posiciones abiertas
- **Performance**: Ganancias/pérdidas diarias

### **2. Trading**
- **Ver Trades**: Historial completo de operaciones
- **Trades Abiertos**: Posiciones activas con detalles
- **Forzar Entradas/Salidas**: Control manual del bot
- **Configuración de Stakes**: Ajustar montos por trade

### **3. Análisis**
- **Gráficos de Precio**: Candlesticks en tiempo real
- **Indicadores Técnicos**: RSI, MACD, EMAs visuales
- **Performance por Par**: Estadísticas detalladas
- **Backtesting**: Resultados de pruebas históricas

### **4. Configuración**
- **Estrategias**: Cambiar estrategia en vivo
- **Pairlists**: Modificar pares de trading
- **Parámetros**: Ajustar ROI, stoploss, etc.
- **Logs**: Ver actividad del bot en tiempo real

## 🎯 **Casos de Uso Principales**

### **Monitoreo en Tiempo Real**
```
- Estado de trades cada 5 minutos
- Alertas de entradas/salidas
- Performance acumulada
- Balance actualizado
```

### **Control Manual**
```
- Forzar compra de un par específico
- Cerrar trades manualmente
- Pausar/reanudar el bot
- Cambiar configuración sin reiniciar
```

### **Análisis de Performance**
```
- Ver gráficos de cada par
- Analizar señales de entrada/salida
- Comparar estrategias
- Exportar datos de trades
```

## ⚙️ **Configuración Actual**

### **Configuración Activa:**
```json
{
  "puerto": 8080,
  "modo": "dry_run (simulación)",
  "estrategia": "AnalisisAltcoins",
  "timeframe": "5m",
  "altcoins": ["SOL", "AVAX", "ATOM", "NEAR", "ALGO", "MANA", "SAND", "AXS"],
  "stake_por_trade": "30 USDT",
  "max_trades": 8,
  "stoploss": "-2%",
  "trailing_stop": "activado"
}
```

## 🔧 **API REST Endpoints Útiles**

### **Información General:**
```bash
# Estado del bot
curl http://localhost:8080/api/v1/status

# Balance actual
curl http://localhost:8080/api/v1/balance

# Trades activos
curl http://localhost:8080/api/v1/trades
```

### **Control del Bot:**
```bash
# Pausar bot
curl -X POST http://localhost:8080/api/v1/stop

# Reanudar bot
curl -X POST http://localhost:8080/api/v1/start

# Forzar entrada (requiere autenticación)
curl -X POST http://localhost:8080/api/v1/forcebuy \
  -H "Content-Type: application/json" \
  -d '{"pair": "SAND/USDT:USDT"}'
```

## 📱 **Uso Móvil**

La interfaz web es responsive y funciona perfecto en móvil:
- **URL móvil**: http://tu-ip:8080
- **Características**: Todos los controles disponibles
- **Notificaciones**: Push notifications del navegador

## 🛡️ **Seguridad**

### **Configuración Actual:**
- **JWT Authentication**: Token seguro requerido
- **CORS**: Configurado para localhost
- **HTTPS**: Recomendado para producción

### **Para Acceso Remoto Seguro:**
```bash
# Cambiar listen_ip_address a 127.0.0.1 en config
# Usar túnel SSH o VPN
ssh -L 8080:localhost:8080 tu-servidor
```

## 🚀 **Comandos Rápidos**

### **Iniciar con Web UI:**
```bash
cd /mnt/zonadatos/zona_zoftware/freqtrade
source .env/bin/activate
freqtrade trade --config user_data/config_webui_simple.json
```

### **Ver logs en tiempo real:**
```bash
tail -f logs/freqtrade.log
```

### **Verificar que funciona:**
```bash
curl http://localhost:8080/api/v1/ping
# Respuesta: {"status":"pong"}
```

## 🎨 **Capturas de Pantalla de Funciones**

### **Dashboard:**
- Gráficos de balance en tiempo real
- Lista de trades con colores (verde=ganancia, rojo=pérdida)
- Indicadores de rendimiento por par

### **Trading View:**
- Candlestick charts interactivos
- Overlays de indicadores técnicos
- Señales de entrada/salida marcadas

### **Configuración:**
- Sliders para ajustar parámetros
- Switches para activar/desactivar funciones
- Editor de estrategias básico

## ✅ **Checklist de Verificación**

- [x] ✅ **Bot funcionando**: Estado = RUNNING
- [x] ✅ **Web UI accesible**: http://localhost:8080
- [x] ✅ **Login funcionando**: admin/admin123
- [x] ✅ **API respondiendo**: /api/v1/ping = pong
- [x] ✅ **Datos en tiempo real**: Websockets activos
- [x] ✅ **Estrategia cargada**: AnalisisAltcoins
- [x] ✅ **8 pares activos**: SOL, AVAX, etc.

## 🎯 **Próximos Pasos**

1. **Abrir navegador**: http://localhost:8080
2. **Login**: admin / admin123
3. **Explorar dashboard**: Ver trades en simulación
4. **Monitorear performance**: Analizar gráficos
5. **Configurar alertas**: Para trades importantes
6. **Modo live**: Cambiar dry_run=false cuando esté listo

**¡La interfaz web está lista y funcionando! 🎉📈**