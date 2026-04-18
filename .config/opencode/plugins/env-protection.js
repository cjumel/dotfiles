export const EnvProtection = async ({ project, client, $, directory, worktree }) => {
  return {
    "tool.execute.before": async (input, output) => {
      if (input.tool === "read" && (output.args.filePath === ".env" || output.args.filePath.endsWith("/.env"))) {
        throw new Error(`Do not read .env files: ${output.args.filePath}`)
      }
    },
  }
}
