# AIMAN.World · Robotics World

## 聚身之家：让机器人产业信息可追溯，也能被 AI 查询

**A source-backed robotics world for people and AI agents.**

AIMAN.World is the parent brand. Robotics World is its robotics-industry World Model. **聚身之家** is the Chinese product name and public entry. It connects robot and company identities with parts, relationships, events, state changes, and evidence so people and AI can research the robotics ecosystem from traceable sources.

聚身之家面向机器人产业研究、产品探索与 AI 查询：从机器人和企业出发，继续查看关系、事件、状态变化与来源证据。缺少信息时保留未知和冲突，不把猜测包装成事实。

> 品牌关系：`AIMAN.World`（母品牌）→ `Robotics World`（机器人产业 World Model）→ `聚身之家`（中文产品名与公开入口）。不要把“聚身”自动改写为“具身”。

## What you can explore

- Robot profiles and evidence-backed specifications.
- Company identities and directional industry relationships.
- Parts and robot composition, with current access through REST.
- Events, exhibitions, and recorded state changes.
- Sources, claims, unknowns, and conflicts behind available records.

Results describe the public read model and its evidence. They are not purchasing, delivery, compatibility, or investment guarantees.

## Connect an AI agent

For compatible clients, use the public MCP endpoint `https://www.aiman.world/mcp`. Start from the live Agent Card and discover tools with `tools/list`; the returned schemas are the current capability contract. No login is required for public reads.

For direct HTTP integrations, start at the [REST guide](https://www.aiman.world/developers/robotics/api). For connection steps, errors, evidence handling, and contribution boundaries, read [AI_ONBOARDING.md](AI_ONBOARDING.md).

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

The live Agent Card, manifests, developer documentation, and current `tools/list` response take precedence over summaries in this repository.

## Open projects

- [Reality-First Development](https://github.com/Azhu9701/reality-first-development) — the Agent development method.
- [Industry World Model](https://github.com/Azhu9701/industry-world-model) — the open World Model framework and reference implementation.

This repository is the product introduction and AI onboarding guide. It does not mirror the production site or its data catalog. See [OPEN_SOURCE_SCOPE.md](OPEN_SOURCE_SCOPE.md).

## 中文

聚身之家是 AIMAN.World 旗下 Robotics World 的中文产品名与公开入口。它将机器人、企业、零部件、关系、事件、状态与证据组织成可查询、可追溯的产业信息世界，帮助人和 AI 开展机器人产业研究与产品探索。

接入 AI：兼容 MCP 的客户端连接 `https://www.aiman.world/mcp`，先读取 [Agent Card](https://www.aiman.world/.well-known/agent-card.json)，再通过 `tools/list` 发现当前工具；也可以按[公开 REST 文档](https://www.aiman.world/developers/robotics/api)直接查询。AI 的贡献材料只进入审核流程，不直接写入已确认的事实。完整步骤见 [AI_ONBOARDING.md](AI_ONBOARDING.md)。

## License

MIT. See [LICENSE](LICENSE).
