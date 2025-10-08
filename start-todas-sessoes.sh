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

echo "🔨 Compilando ambas as sessões..."
./start-sessao7774.sh compile
./start-sessao7775.sh compile

echo ""
echo "🎯 CONFIGURAÇÃO COMPLETA!"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "1. Abra uma NOVA sessão do Termux"
echo "2. Execute: cd wuzapi-termux-scripts && ./start-sessao7774.sh"
echo "3. Abra OUTRA sessão do Termux" 
echo "4. Execute: cd wuzapi-termux-scripts && ./start-sessao7775.sh"
echo ""
echo "📱 URLs:"
echo "Sessão 1: http://localhost:8080 (Token: 7774)"
echo "Sessão 2: http://localhost:8081 (Token: 7775)"
echo ""
echo "🛑 Parar tudo: ./parar-tudo.sh"

exit 0
