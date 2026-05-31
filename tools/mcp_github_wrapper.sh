#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f "$DIR/../.env.mcp" ]; then
  # Load environment variables from .env.mcp, ignoring comments and empty lines
  export $(grep -v '^#' "$DIR/../.env.mcp" | xargs)
fi

exec npx -y @modelcontextprotocol/server-github
