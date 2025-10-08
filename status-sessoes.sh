#!/bin/bash
echo "📊 STATUS DAS SESSÕES WUZAPI"
echo "================================"

# Sessão 7774
echo ""
echo "🔍 SESSÃO 7774 (Porta 8080):"
if pgrep -f "wuzapi7774" > /dev/null; then
    echo "✅ STATUS: RODANDO"
    echo "📝 ÚLTIMAS LINHAS DO LOG:"
    tail -5 ~/wuzapi7774/wuzapi7774.log 2>/dev/null || echo "Arquivo de log não encontrado"
else
    echo "❌ STATUS: PARADA"
fi

# Sessão 7775
echo ""
echo "🔍 SESSÃO 7775 (Porta 8081):"
if pgrep -f "wuzapi7775" > /dev/null; then
    echo "✅ STATUS: RODANDO"
    echo "📝 ÚLTIMAS LINHAS DO LOG:"
    tail -5 ~/wuzapi7775/wuzapi7775.log 2>/dev/null || echo "Arquivo de log não encontrado"
else
    echo "❌ STATUS: PARADA"
fi

# Testar portas
echo ""
echo "🌐 TESTE DE CONECTIVidade:"
echo "Porta 8080: $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ 2>/dev/null || echo "OFFLINE")"
echo "Porta 8081: $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8081/ 2>/dev/null || echo "OFFLINE")"

echo ""
echo "💡 COMANDOS ÚTEIS:"
echo "Iniciar: ./start-todas-sessoes.sh"
echo "Parar: ./parar-tudo.sh"
echo "Status: ./status-sessoes.sh"

exit 0
