#!/usr/bin/env bash
# wait-for-it.sh: aguarda um host:porta ficar disponível

set -e

HOST="$1"
shift
PORT="$1"
shift

TIMEOUT=60
DELAY=2

echo "⏳ Aguardando $HOST:$PORT ficar disponível..."

for i in $(seq 1 $TIMEOUT); do
if timeout 1 bash -c "</dev/tcp/$HOST/$PORT"; then
    echo "✅ $HOST:$PORT está pronto!"
    exec "$@"
fi
  sleep $DELAY
done

echo "❌ Timeout após $TIMEOUT segundos aguardando $HOST:$PORT"
exit 1
