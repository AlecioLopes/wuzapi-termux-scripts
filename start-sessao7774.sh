#!/bin/bash
SESSION_DIR="$HOME/wuzapi7774"
LOG_FILE="$SESSION_DIR/wuzapi7774.log"

cd "$SESSION_DIR"

# Função para criar .env automaticamente
criar_env_7774() {
    cat > .env << 'EOF'
WUZAPI_ADMIN_TOKEN=7774
TZ=America/Sao_Paulo
SESSION_DEVICE_NAME=WuzAPI7774
MEDIA_DIR=/storage/emulated/0/WuzAPI/media
SQLITE_BUSY_TIMEOUT=10000
WUZAPI_PORT=8080
EOF
    echo "✅ Arquivo .env criado automaticamente para sessão 7774"
}

# Clonar se não existir
if [ ! -d ".git" ]; then
    echo "📥 Clonando repositório para Sessão 7774..." | tee -a "$LOG_FILE"
    git clone https://github.com/asternic/wuzapi.git . >> "$LOG_FILE" 2>&1
fi

export GO111MODULE=on

# Criar .env automaticamente
criar_env_7774

echo "🔨 Compilando Sessão 7774..." | tee -a "$LOG_FILE"
go get -u go.mau.fi/whatsmeow@latest >> "$LOG_FILE" 2>&1
go mod tidy >> "$LOG_FILE" 2>&1
go build . >> "$LOG_FILE" 2>&1

echo "🚀 Iniciando Sessão 7774 na porta 8080..." | tee -a "$LOG_FILE"
echo "📝 Logs salvos em: $LOG_FILE" | tee -a "$LOG_FILE"

# Loop infinito para manter rodando em background
while true; do
    echo "$(date): Iniciando WuzAPI Sessão 7774" >> "$LOG_FILE"
    ./wuzapi -logtype=console -color=true >> "$LOG_FILE" 2>&1
    
    # Se o processo cair, espera 10 segundos e reinicia
    echo "$(date): WuzAPI caiu, reiniciando em 10 segundos..." >> "$LOG_FILE"
    sleep 10
done
