#!/bin/bash
echo "🚀 Iniciando todas as sessões do WuzAPI em background..."

# Criar diretórios
mkdir -p ~/wuzapi7774
mkdir -p ~/wuzapi7775
mkdir -p /storage/emulated/0/WuzAPI/media
mkdir -p /storage/emulated/0/WuzAPI/media2

echo "📦 Atualizando pacotes..."
pkg update && pkg upgrade -y

echo "🔧 Instalando dependências..."
pkg install golang git -y

termux-setup-storage

export GO111MODULE=on

# Executar sessões em background com logs
echo "🔄 Iniciando Sessão 7774 em background..."
./start-sessao7774.sh &

echo "🔄 Iniciando Sessão 7775 em background..."
./start-sessao7775.sh &

echo "⏳ Aguardando inicialização..."
sleep 15

echo "✅ Sessões iniciadas em background!"
echo "📱 Sessão 1: http://localhost:8080 (Token: 7774)"
echo "📱 Sessão 2: http://localhost:8081 (Token: 7775)"
echo "📊 Ver logs: tail -f wuzapi7774.log ou tail -f wuzapi7775.log"
echo "❌ Parar tudo: ./parar-tudo.sh"
