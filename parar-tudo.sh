#!/bin/bash
echo "🛑 Parando todas as sessões..."

pkill -f "wuzapi"
pkill -f "start-sessao7774.sh"
pkill -f "start-sessao7775.sh"

# Também para processos específicos
pkill -f "wuzapi7774"
pkill -f "wuzapi7775"

echo "✅ Todas as sessões paradas!"
echo "📊 Logs finais disponíveis em:"
echo "   ~/wuzapi7774/wuzapi7774.log"
echo "   ~/wuzapi7775/wuzapi7775.log"
