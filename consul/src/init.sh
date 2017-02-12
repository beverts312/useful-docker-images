#!/bin/sh
if [ "$MODE" = "custom" ]; then
  consul agent "$@"
elif [ "$MODE" = "agent" ] && [ "$secure" != "true" ]; then
  consul agent -config-file=/consul/agent.json "$@"
elif [ "$MODE" = "agent" ]; then
  sed -i "s|##ACL_TOKEN##|$ACL_TOKEN|g" /consul/secure-agent.json
  consul agent  -config-file=/consul/secure-agent.json "$@"
elif [ "$SECURE" = "true" ]; then
  sed -i "s|##ACL_MASTER_TOKEN##|$ACL_MASTER_TOKEN|g" /consul/secure-server.json
  consul agent -server -config-file=/consul/secure-server.json  -ui-dir /consul/ui "$@"
else
  consul agent -server -config-file=/consul/server.json -ui-dir /consul/ui "$@"
fi
