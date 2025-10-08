#!/bin/bash
echo "📊 Status das Sessões WuzAPI"

echo ""
echo "🔍 Sessão 7774 (Porta 8080):"
if pgrep -f "wuzapi7774" > /dev/null; then
    echo "✅ RODANDO"
    echo "📝 Últimas linhas do log:"
    tail -5 ~/wuzapi7774/wuzapi7774.log
else
    echo "❌ PARADA"
fi

echo ""
echo "🔍 Sessão 7775 (Porta 8081):"
if pgrep -f "wuzapi7775" > /dev/null; then
    echo "✅ RODANDO"
    echo "📝 Últimas linhas do log:"
    tail -5 ~/wuzapi7775/wuzapi7775.log
else
    echo "❌ PARADA"
fi

echo ""
echo "🌐 Testando portas..."
echo "Porta 8080: $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ || echo 'OFFLINE')"
echo "Porta 8081: $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8081/ || echo 'OFFLINE')"
