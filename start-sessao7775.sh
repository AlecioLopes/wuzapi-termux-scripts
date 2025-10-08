#!/bin/bash
SESSION_DIR="$HOME/wuzapi7775"
LOG_FILE="$SESSION_DIR/wuzapi7775.log"

echo "🔧 Configurando Sessão 7775..."
cd "$SESSION_DIR"

# Criar .env automaticamente
criar_env_7775() {
    cat > .env << 'EOF'
WUZAPI_ADMIN_TOKEN=7775
TZ=America/Sao_Paulo
SESSION_DEVICE_NAME=WuzAPI7775
MEDIA_DIR=/storage/emulated/0/WuzAPI/media2
SQLITE_BUSY_TIMEOUT=10000
WUZAPI_PORT=8081
EOF
    echo "✅ Arquivo .env criado para sessão 7775" >> "$LOG_FILE"
}

# Clonar repositório se não existir
if [ ! -d ".git" ]; then
    echo "📥 Clonando repositório para Sessão 7775..." >> "$LOG_FILE"
    git clone https://github.com/asternic/wuzapi.git . >> "$LOG_FILE" 2>&1
    echo "✅ Repositório clonado" >> "$LOG_FILE"
fi

export GO111MODULE=on

# Criar .env
criar_env_7775

echo "🔨 Compilando Sessão 7775..." >> "$LOG_FILE"
go get -u go.mau.fi/whatsmeow@latest >> "$LOG_FILE" 2>&1
go mod tidy >> "$LOG_FILE" 2>&1
go build . >> "$LOG_FILE" 2>&1
echo "✅ Compilação concluída" >> "$LOG_FILE"

echo "🚀 INICIANDO SESSÃO 7775 NA PORTA 8081" >> "$LOG_FILE"
echo "📝 Logs sendo salvos em: $LOG_FILE" >> "$LOG_FILE"

# Loop infinito para manter rodando
while true; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "🟢 [$TIMESTAMP] Iniciando WuzAPI Sessão 7775" >> "$LOG_FILE"
    
    # Executar WuzAPI
    ./wuzapi -logtype=console -color=true >> "$LOG_FILE" 2>&1
    
    # Se chegou aqui, o processo caiu
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "🔴 [$TIMESTAMP] WuzAPI caiu! Reiniciando em 10 segundos..." >> "$LOG_FILE"
    sleep 10
done

echo "❌ Script sessao7775 finalizado inesperadamente" >> "$LOG_FILE"
exit 1
