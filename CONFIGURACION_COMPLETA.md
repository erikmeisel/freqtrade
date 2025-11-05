# 🚀 Freqtrade + Bybit - Configuración Completa

## ✅ ¿Qué se ha configurado?

### 1. **Instalación Completa**
- ✅ Freqtrade instalado y funcionando
- ✅ Entorno virtual configurado (`.env/`)
- ✅ Dependencias instaladas
- ✅ Conexión con Bybit verificada

### 2. **Archivos de Configuración Creados**
```
user_data/
├── config_bybit.json              # Spot Trading (con tus API keys)
├── config_bybit_futures.json      # Futures Trading (con tus API keys)  
├── config_bybit_env.json          # Versión segura (usa variables entorno)
└── README_bybit.md               # Documentación completa
```

### 3. **Scripts de Automatización**
- ✅ `setup_bybit.sh` - Script de instalación
- ✅ `usar_bot.sh` - Script interactivo para usar el bot
- ✅ `variables_entorno.sh` - Variables de entorno seguras

### 4. **Conexión Verificada** 
- ✅ API Keys configuradas y funcionando
- ✅ 2386 mercados disponibles en Bybit
- ✅ Descarga de datos históricos probada

## 🚦 Primeros Pasos

### Opción 1: Uso Rápido (Script Interactivo)
```bash
cd /mnt/zonadatos/zona_zoftware/freqtrade
./usar_bot.sh
```

### Opción 2: Comandos Manuales

#### 1️⃣ Activar entorno
```bash
cd /mnt/zonadatos/zona_zoftware/freqtrade
source .env/bin/activate
```

#### 2️⃣ Descargar datos (recomendado)
```bash
freqtrade download-data --config user_data/config_bybit.json --days 30 --timeframes 5m 1h
```

#### 3️⃣ Backtesting (probar estrategia)
```bash
freqtrade backtesting --config user_data/config_bybit.json
```

#### 4️⃣ Ejecutar en simulación
```bash
freqtrade trade --config user_data/config_bybit.json
```

#### 5️⃣ Interfaz web
```bash
freqtrade webserver --config user_data/config_bybit.json
# Abrir: http://localhost:8080
# Usuario: freqtrader
# Contraseña: CambiarPorPasswordSeguro123!
```

## ⚙️ Configuraciones Actuales

### **Spot Trading** (`config_bybit.json`)
- 💰 **Stake:** 50 USDT por operación
- 📈 **Max trades:** 5 simultáneos
- ⏱️ **Timeframe:** 5 minutos
- 🛑 **Stop loss:** -10%
- 🎯 **ROI:** 4% → 2% → 1% → 0%
- 🔄 **Modo:** DRY-RUN (simulación)

### **Futures Trading** (`config_bybit_futures.json`)
- 💰 **Stake:** 100 USDT por operación
- 📈 **Max trades:** 3 simultáneos
- ⚡ **Margin:** Aislado
- 🛑 **Stop loss en exchange:** Activado
- 🔄 **Modo:** DRY-RUN (simulación)

### **Pares Configurados**
```
BTC/USDT, ETH/USDT, BNB/USDT
ADA/USDT, DOT/USDT, LINK/USDT  
UNI/USDT, LTC/USDT, BCH/USDT, XRP/USDT
```

## 🔒 Recomendaciones de Seguridad

### ✅ YA CONFIGURADO
- API Keys de Bybit integradas
- Rate limiting activado (100ms entre calls)
- Modo dry-run activado por defecto

### 🔧 PENDIENTE (Recomendado)
1. **Cambiar contraseñas por defecto:**
   - Interfaz web: `CambiarPorPasswordSeguro123!`
   - JWT Secret: `cambiar_por_algo_seguro_y_aleatorio`

2. **Usar variables de entorno (más seguro):**
   ```bash
   source variables_entorno.sh
   freqtrade trade --config user_data/config_bybit_env.json
   ```

3. **Configurar restricciones IP en Bybit**

4. **Configurar Telegram (opcional):**
   - Crear bot con @BotFather
   - Obtener token y chat_id
   - Activar en configuración

## 📊 Monitoreo y Logs

### Interfaz Web
- URL: http://localhost:8080
- Funciones: Ver trades, balance, rendimiento, logs

### Logs del Sistema
```bash
tail -f user_data/logs/freqtrade.log
```

### Comandos de Estado
```bash
# Ver configuración
freqtrade show-config --config user_data/config_bybit.json

# Listar pares disponibles  
freqtrade list-pairs --config user_data/config_bybit.json --quote USDT

# Ver estrategias
freqtrade list-strategies
```

## ⚠️ IMPORTANTE: Antes de Trading Real

1. **Probar en DRY-RUN** (ya configurado)
2. **Hacer backtesting** con datos históricos
3. **Verificar estrategia** con simulación
4. **Empezar con cantidades pequeñas**
5. **Cambiar** `"dry_run": true` a `"dry_run": false`

## 🆘 Soporte

- **Documentación:** [freqtrade.io](https://www.freqtrade.io)
- **Discord:** [Comunidad Freqtrade](https://discord.gg/p7nuUNVfP7)
- **Logs:** `user_data/logs/`
- **Config:** `user_data/README_bybit.md`

---

## 🎉 ¡Tu bot está listo!

**Estado actual:** ✅ Configurado y funcional  
**Próximo paso:** Ejecutar `./usar_bot.sh` y elegir la opción que prefieras

**¿Necesitas ayuda?** Revisa `user_data/README_bybit.md` para más detalles.