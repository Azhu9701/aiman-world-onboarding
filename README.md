# AIMAN.World · Robotics World

## 聚身之家：让机器人产业信息可追溯，也能被 AI 查询

**A source-backed robotics world for people and AI agents.**

AIMAN.World is the parent brand. Robotics World is its robotics-industry World Model. **聚身之家** is the Chinese product name and public entry. It connects robot and company identities with parts, relationships, events, state changes, and evidence so people and AI can research the robotics ecosystem from traceable sources.

聚身之家帮助人和 AI 查询机器人、企业、零部件、产业关系、事件与状态，并沿着记录查看来源证据。信息缺失、身份歧义或来源冲突时，保留这些边界，不把猜测写成事实。

> 品牌关系：`AIMAN.World`（母品牌）→ `Robotics World`（机器人产业 World Model）→ `聚身之家`（中文产品名与公开入口）。不要把“聚身”自动改写为“具身”。当前公开开发入口开放的是 Robotics World。

## What you can explore

| Research task | Public entry |
| --- | --- |
| Find robot models and inspect their identity and available specifications | [Robot REST API](https://www.aiman.world/developers/robotics/api) or discovered MCP tools |
| Explore companies and directional relationships | [REST API](https://www.aiman.world/developers/robotics/api) or discovered MCP tools |
| Read parts and robot composition | REST API; parts lookup is currently REST-only |
| Follow events, exhibitions, and recorded state changes | [Timeline and State guide](https://www.aiman.world/developers/robotics/timeline) |
| Check how claims relate to sources, unknowns, and conflicts | [Evidence guide](https://www.aiman.world/developers/robotics/evidence) |

Records describe the public read model and the evidence actually available for each claim. They are not purchasing, delivery, compatibility, or investment guarantees.

## Connect an AI agent

For an MCP-compatible client, configure the remote server URL as `https://www.aiman.world/mcp`. Public reads need no login. Initialize the connection, call `tools/list`, and build requests from the live `inputSchema`; tool names and schemas can change. The endpoint currently uses stateless Streamable HTTP with JSON responses and does not provide SSE.

If your agent does not support MCP, use the public [REST guide](https://www.aiman.world/developers/robotics/api). REST query parameters and response shapes differ by endpoint; there is currently no single OpenAPI contract for the whole site.

Run a live, read-only example from a clone:

```sh
sh examples/mcp-search-robots.sh
sh examples/rest-search-robots.sh
```

For the full workflow—discovery, querying, evidence handling, errors, and contribution boundaries—see [AI_ONBOARDING.md](AI_ONBOARDING.md) and the official [Agent Guide](https://www.aiman.world/developers/agent).

## Official entry points

- [Open AIMAN.World](https://www.aiman.world/)
- [About Robotics World / 聚身之家](https://www.aiman.world/about)
- [Developer portal](https://www.aiman.world/developers)
- [Agent Card](https://www.aiman.world/.well-known/agent-card.json)
- [Identity manifest](https://www.aiman.world/.well-known/aiman.json)
- [Agent Guide](https://www.aiman.world/developers/agent)
- [MCP guide](https://www.aiman.world/developers/robotics/mcp)
- [REST guide](https://www.aiman.world/developers/robotics/api)
- [Contribution guide](https://www.aiman.world/developers/contribute)

The live Agent Card, manifests, developer documentation, and current `tools/list` response take precedence over summaries in this repository. In particular, `plannedSkills` describes possible future work and does not mean those capabilities are open today.

## Open projects

- [Reality-First Development](https://github.com/Azhu9701/reality-first-development) — the Agent development method.
- [Industry World Model](https://github.com/Azhu9701/industry-world-model) — the open World Model framework and reference implementation.

This repository introduces the product and helps AI developers get started. It does not mirror the production site, its implementation, or its data catalog. See [OPEN_SOURCE_SCOPE.md](OPEN_SOURCE_SCOPE.md).

## 中文接入摘要

AI 可以通过兼容 MCP 的客户端连接 `https://www.aiman.world/mcp`；先读取 [Agent Card](https://www.aiman.world/.well-known/agent-card.json)，再通过 `tools/list` 发现当前能力。没有 MCP 的系统可以使用[公开 REST API](https://www.aiman.world/developers/robotics/api)。

AI 提交的观察材料进入审核流程，不会直接写入已确认事实。完整步骤见 [AI 接入指南](AI_ONBOARDING.md)；项目公开范围见 [OPEN_SOURCE_SCOPE.md](OPEN_SOURCE_SCOPE.md)。

## License

MIT. See [LICENSE](LICENSE).
