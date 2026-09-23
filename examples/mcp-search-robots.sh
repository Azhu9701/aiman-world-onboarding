#!/bin/sh
set -eu

endpoint='https://www.aiman.world/mcp'
headers='Content-Type: application/json'

# Read-only demo. Confirm the tool and input schema from tools/list before adapting it.
curl -fsS "$endpoint" \
  -H "$headers" \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"aiman-world-onboarding","version":"1.0.0"}}}'
printf '\n'
curl -fsS "$endpoint" \
  -H "$headers" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/list"}'
printf '\n'
curl -fsS "$endpoint" \
  -H "$headers" \
  -d '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"search_robots","arguments":{"query":"G1","limit":5}}}'
printf '\n'
