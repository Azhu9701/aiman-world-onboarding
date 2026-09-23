# AI Agent Onboarding

This guide connects an AI agent to the **public** AIMAN.World Robotics World interfaces. The live service is the source of current data and capability contracts; this repository is an introduction, not a mirror of them.

## 1. Choose an interface

- **MCP** is the shortest path for an assistant that can use remote MCP tools.
- **REST** is available for direct HTTP integrations and also covers parts lookup.
- Read the live [Agent Card](https://www.aiman.world/.well-known/agent-card.json) to identify the service and its advertised capabilities.

The current public developer entry covers Robotics World. There is no single OpenAPI document for all REST endpoints, so use the endpoint-specific [REST guide](https://www.aiman.world/developers/robotics/api). `plannedSkills` in the Agent Card are not available capabilities.

## 2. Connect with MCP

Configure your MCP client with these connection details:

| Setting | Value |
| --- | --- |
| Remote server URL | `https://www.aiman.world/mcp` |
| Transport | Stateless Streamable HTTP; JSON responses, no SSE |
| Authentication for public reads | None |
| Discovery order | `initialize` → `tools/list` → `tools/call` |

The endpoint exposes a read-only MCP interface. Discover tools and their current `inputSchema` at connection time; do not hard-code a tool count or assume a capability exists because it appears in a general product description. See the official [MCP guide](https://www.aiman.world/developers/robotics/mcp) for protocol details.

Run a complete, read-only sample that discovers tools and searches for robot candidates:

```sh
sh examples/mcp-search-robots.sh
```

The sample uses the currently documented `search_robots` tool and the query `G1`. Its output is live and may change. Confirm the tool and arguments against the preceding `tools/list` response before adapting the call.

## 3. Make a useful first query

A reliable research flow is:

1. Search for candidate robots or companies.
2. Use the returned canonical identity to read the detail record.
3. Check `identity` for ambiguity and `provenance` or `evidence` for the source behind each claim.
4. State missing, conflicting, or inaccessible information explicitly.

For direct REST access, the example performs a public search and prints the live response:

```sh
sh examples/rest-search-robots.sh
```

For a selected robot, use its returned ID or slug with `GET /api/robots/{id}` and inspect `identity` and `provenance`. Do not invent IDs from names or treat a search miss as proof that something does not exist. Parameter names and response shapes vary by endpoint.

## 4. Preserve the evidence and identity boundaries

- Do not merge records by name alone. Keep ambiguous candidates separate.
- Distinguish a verified fact from a company or source claim, an opinion, and an analysis.
- Keep source, applicable time, review status, unknowns, and conflicts distinct.
- `null`, an absent field, an empty list, `unknown`, and `conflict` do not mean the same thing. Do not turn them into `0`, `false`, or “does not exist.”
- A source page does not support every possible claim about the entity; verify that the cited material actually supports the field.
- A tool schema describes the request contract. It does not grant authority to buy, publish, or modify records.

The live [Agent Guide](https://www.aiman.world/developers/agent) and [Evidence guide](https://www.aiman.world/developers/robotics/evidence) are the detailed behavior contracts.

## 5. Handle errors as signals

- Check HTTP status as well as the JSON-RPC response. HTTP 200 can still contain `result.isError: true`.
- MCP `-32602` means the method or arguments do not match the current contract; re-read `tools/list` and its `inputSchema`.
- For REST parameter errors, use the endpoint's documented allowed parameters. Do not drop a filter and present a broader result as if it answered the original query.
- On `401` or `403`, stop and check authorization. On `429` or `5xx`, report temporary unavailability or use bounded retries; do not turn a failure into an empty successful answer.

## 6. Contributions require review

Public contribution intake accepts observation materials described by the live [Contribution Manifest](https://www.aiman.world/.well-known/aiman-contribution.json). A receipt means the material was received for review, not that the claim was accepted or published; `canonicalWrites` is `false`.

Only submit material when the user's task authorizes it. Company Agents follow a separate, scoped and company-bound process in [Contribute to the World](https://www.aiman.world/developers/contribute). Never put credentials in this repository, a prompt, a public issue, or a client-side example.

## 中文接入摘要

1. 先读取 Agent Card，确认 AIMAN.World / Robotics World / 聚身之家的身份和能力边界。
2. MCP 客户端连接 `https://www.aiman.world/mcp`，按 `initialize`、`tools/list`、`tools/call` 发现并调用只读工具。
3. 不支持 MCP 时使用公开 REST；参数、返回字段以对应实时文档为准。
4. 从候选查询进入规范身份，再查看来源证据；保留未知、歧义和冲突。
5. 只有在用户任务授权时才提交材料；回执不代表审核通过，也不写入 canonical 事实。

不同 MCP 客户端的配置界面各不相同。本仓库提供通用服务器地址和可运行的协议示例，不假设某个客户端专属配置格式。
