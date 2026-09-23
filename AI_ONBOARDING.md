# AI Agent Onboarding

This guide describes how to connect an AI agent to the **public** AIMAN.World Robotics World interfaces. The production service is the source of current data and capabilities; this repository is an introduction, not a mirror of those contracts.

## 1. Discover identity and capabilities

Read the live [Agent Card](https://www.aiman.world/.well-known/agent-card.json) first. It identifies AIMAN.World, Robotics World, 聚身之家, public capabilities, and contribution boundaries. The [identity manifest](https://www.aiman.world/.well-known/aiman.json) and [developer portal](https://www.aiman.world/developers) provide additional context.

For MCP, initialize a compatible remote MCP client and call `tools/list`. Build tool calls from the live `inputSchema`; do not rely on a tool count or a saved list. Some capabilities, including parts lookup, are currently REST-only. Check the [current MCP guide](https://www.aiman.world/developers/robotics/mcp) before implementation.

## 2. Connect with MCP

- Endpoint: `POST https://www.aiman.world/mcp`
- Transport: stateless Streamable HTTP with JSON-RPC JSON responses; the current service does not use SSE.
- Public read access: no login required.
- Discovery: `initialize` → `tools/list` → `tools/call`.

The small example below performs discovery only; it does not submit contributions or modify data:

```sh
sh examples/mcp-discover.sh
```

To call a tool, use its current name and schema from `tools/list`. For example, the current public documentation shows `search_robots` with a `query` and optional `limit`. The live schema remains authoritative if it changes.

## 3. Connect with REST

Public read endpoints do not require login. This example searches for candidates and returns the server response without assuming that a match exists:

```sh
sh examples/rest-search-robots.sh
```

Use the returned canonical ID to request a detail record, then inspect its `identity` and `provenance`. See the [REST guide](https://www.aiman.world/developers/robotics/api) for endpoint-specific query names and response shapes. Parameter names are case-sensitive; different endpoints may use different pagination names.

## 4. Read results carefully

- A search miss means the current query found no match; it does not prove that a real-world entity or event does not exist.
- Preserve ambiguous identities and candidates. Do not merge records by name alone.
- Keep source, time, claim type, review status, unknowns, and conflicts distinct.
- Check HTTP status and the JSON-RPC `result.isError` flag. HTTP 200 alone does not mean the tool succeeded.
- Treat tool annotations and schemas as capability descriptions, not authorization to perform unrelated actions.

The full behavior contract is the live [Agent Guide](https://www.aiman.world/developers/agent).

## 5. Contributions and authorization

The public [Contribution Manifest](https://www.aiman.world/.well-known/aiman-contribution.json) describes the currently accepted observation-material types and receipt lookup. Contributions enter a review queue; `canonicalWrites` is `false`. A successful receipt means material was received, not that a fact was approved or published.

Company Agents use a separate, scoped and company-bound integration documented in [Contribute to the World](https://www.aiman.world/developers/contribute). Credentials are issued through that process. Never put API keys in a repository, prompt, public issue, or client-side example.

## 当前接入摘要

1. 先读取 Agent Card，确认品牌身份和当前能力。
2. 兼容 MCP 的客户端连接 `https://www.aiman.world/mcp`，按 `initialize`、`tools/list`、`tools/call` 顺序操作。
3. 也可直接调用公开 REST GET 接口；各端点参数和返回结构以实时文档为准。
4. 追溯规范实体和来源，保留未知、歧义与冲突。
5. 提交材料只代表进入审核流程，不能当作事实已采纳。

MCP 客户端的配置格式因产品而异。本仓库给出稳定的服务器地址和通用发现流程，不代替具体客户端的配置说明。
