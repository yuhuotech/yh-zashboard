# YH Zashboard

自动部署最新版 [Zashboard](https://github.com/Zephyruso/zashboard) 到 Vercel 的仓库。

## 设置说明

### 1. Vercel 配置

你需要在 GitHub 仓库中配置以下 Secrets：

- **VERCEL_TOKEN**: 你的 Vercel API Token
  - 获取方式：https://vercel.com/account/tokens

- **VERCEL_ORG_ID**: 你的 Vercel 组织 ID
  - 在项目设置中可以找到

- **VERCEL_PROJECT_ID**: 你的 Vercel 项目 ID
  - 在项目设置中可以找到

### 2. 添加 Secrets

1. 进入你的 GitHub 仓库
2. 点击 `Settings` → `Secrets and variables` → `Actions`
3. 点击 `New repository secret`
4. 分别添加上述三个 Secrets

### 3. 自动化工作流

- 工作流每天 UTC 时间 00:00 自动运行
- 也可以在 GitHub Actions 标签页中手动触发
- 工作流会：
  1. 下载最新的 zashboard 发布版本
  2. 解压到 `dist` 目录
  3. 部署到 Vercel
  4. 将更新提交回仓库（可选）

## 手动部署

```bash
npm install -g vercel
vercel deploy --prod
```

## 项目结构

- `.github/workflows/deploy-zashboard.yml` - GitHub Actions 工作流配置
- `vercel.json` - Vercel 部署配置
- `dist/` - 部署的静态文件（自动生成）

## 调整计划任务

编辑 `.github/workflows/deploy-zashboard.yml` 中的 `schedule` 部分：

```yaml
schedule:
  - cron: '0 0 * * *'  # 当前：每天 00:00 UTC
```

Cron 格式说明：`分 小时 日 月 周`

例如：
- `0 8 * * *` - 每天 08:00 UTC
- `0 */6 * * *` - 每 6 小时
- `0 0 * * 0` - 每周一 00:00 UTC
