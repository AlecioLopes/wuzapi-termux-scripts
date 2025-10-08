#!/bin/bash
echo "🚀 Iniciando todas as sessões do WuzAPI..."

# Tornar todos os scripts executáveis
chmod +x start-sessao7774.sh start-sessao7775.sh parar-tudo.sh status-sessoes.sh
echo "✅ Todos os scripts tornados executáveis"

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

# Executar sessões em background
echo "🔄 Iniciando Sessão 7774 em background..."
./start-sessao7774.sh &

echo "🔄 Iniciando Sessão 7775 em background..."
./start-sessao7775.sh &

echo "⏳ Aguardando 20 segundos para inicialização completa..."
sleep 20

echo "🎉 CONFIGURAÇÃO FINALIZADA!"
echo "📱 Sessão 1: http://localhost:8080 (Token: 7774)"
echo "📱 Sessão 2: http://localhost:8081 (Token: 7775)"
echo "📊 Ver logs: tail -f ~/wuzapi7774/wuzapi7774.log"
echo "🛑 Parar tudo: ./parar-tudo.sh"
echo "📋 Ver status: ./status-sessoes.sh"

# Finalizar script principal
echo "✅ Script principal finalizado. Sessões rodando em background."
exit 0
