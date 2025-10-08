#!/bin/bash
SESSION_DIR="$HOME/wuzapi7774"
LOG_FILE="$SESSION_DIR/wuzapi7774.log"

echo "🔧 Configurando Sessão 7774..."
cd "$SESSION_DIR"

# Criar .env automaticamente
criar_env_7774() {
    cat > .env << 'EOF'
WUZAPI_ADMIN_TOKEN=7774
TZ=America/Sao_Paulo
SESSION_DEVICE_NAME=WuzAPI7774
MEDIA_DIR=/storage/emulated/0/WuzAPI/media
SQLITE_BUSY_TIMEOUT=10000
WUZAPI_PORT=8080
EOF
    echo "✅ Arquivo .env criado para sessão 7774" >> "$LOG_FILE"
}

# Clonar repositório se não existir
if [ ! -d ".git" ]; then
    echo "📥 Clonando repositório para Sessão 7774..." >> "$LOG_FILE"
    git clone https://github.com/asternic/wuzapi.git . >> "$LOG_FILE" 2>&1
    echo "✅ Repositório clonado" >> "$LOG_FILE"
fi

export GO111MODULE=on

# Criar .env
criar_env_7774

echo "🔨 Compilando Sessão 7774..." >> "$LOG_FILE"
go get -u go.mau.fi/whatsmeow@latest >> "$LOG_FILE" 2>&1
go mod tidy >> "$LOG_FILE" 2>&1
go build . >> "$LOG_FILE" 2>&1
echo "✅ Compilação concluída" >> "$LOG_FILE"

echo "🚀 INICIANDO SESSÃO 7774 NA PORTA 8080" >> "$LOG_FILE"
echo "📝 Logs sendo salvos em: $LOG_FILE" >> "$LOG_FILE"

# Loop infinito para manter rodando
while true; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "🟢 [$TIMESTAMP] Iniciando WuzAPI Sessão 7774" >> "$LOG_FILE"
    
    # Executar WuzAPI
    ./wuzapi -logtype=console -color=true >> "$LOG_FILE" 2>&1
    
    # Se chegou aqui, o processo caiu
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "🔴 [$TIMESTAMP] WuzAPI caiu! Reiniciando em 10 segundos..." >> "$LOG_FILE"
    sleep 10
done

echo "❌ Script sessao7774 finalizado inesperadamente" >> "$LOG_FILE"
exit 1
