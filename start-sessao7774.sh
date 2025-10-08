#!/bin/bash
SESSION_DIR="$HOME/wuzapi7774"
LOG_FILE="$SESSION_DIR/wuzapi7774.log"

cd "$SESSION_DIR"

# Função para compilar
compilar() {
    echo "🔨 Compilando Sessão 7774..."
    criar_env_7774
    export GO111MODULE=on
    go get -u go.mau.fi/whatsmeow@latest
    go mod tidy
    go build .
    echo "✅ Compilação concluída"
    exit 0
}

# Se passar "compile" como argumento, só compila
if [ "$1" = "compile" ]; then
    compilar
fi

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
    echo "✅ Arquivo .env criado para sessão 7774"
}

# Clonar repositório se não existir
if [ ! -d ".git" ]; then
    echo "📥 Clonando repositório para Sessão 7774..."
    git clone https://github.com/asternic/wuzapi.git .
fi

export GO111MODULE=on
criar_env_7774

echo "🚀 INICIANDO SESSÃO 7774 NA PORTA 8080"
echo "📝 Logs: $LOG_FILE"

# Loop infinito para manter rodando
while true; do
    echo "$(date): Iniciando WuzAPI Sessão 7774"
    ./wuzapi -logtype=console -color=true
    echo "$(date): WuzAPI caiu! Reiniciando em 10 segundos..."
    sleep 10
done
