#!/bin/bash
echo "🛑 Parando todas as sessões WuzAPI..."

# Parar processos
pkill -f "wuzapi" && echo "✅ Processos wuzapi finalizados"
pkill -f "start-sessao7774.sh" && echo "✅ Sessão 7774 finalizada"
pkill -f "start-sessao7775.sh" && echo "✅ Sessão 7775 finalizada"

# Parar processos específicos
pkill -f "wuzapi7774" && echo "✅ Processo wuzapi7774 finalizado"
pkill -f "wuzapi7775" && echo "✅ Processo wuzapi7775 finalizado"

echo ""
echo "📊 Status final:"
echo "Sessão 7774: $(pgrep -f 'wuzapi7774' > /dev/null && echo '❌ AINDA RODANDO' || echo '✅ PARADA')"
echo "Sessão 7775: $(pgrep -f 'wuzapi7775' > /dev/null && echo '❌ AINDA RODANDO' || echo '✅ PARADA')"

echo ""
echo "🎯 PARADA COMPLETA!"
echo "💡 Para iniciar novamente: ./start-todas-sessoes.sh"

exit 0
