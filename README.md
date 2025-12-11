# Claude Code Multi-Model Launcher

This tool extends [Anthropic's Claude Code CLI](https://github.com/anthropics/claude-code) to support **any** LLM provider (Gemini, OpenAI, MiniMax, Groq, ZhipuAI/GLM, etc.) by using [LiteLLM](https://github.com/BerriAI/litellm) as a local proxy.

## 🚀 Installation

Run this single command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/zesbe/CliAllModel/main/install.sh | bash
```

## 🛠 Usage

Just run:
```bash
claude-all
```

You will see a menu to select your provider:
1. **MiniMax** (Direct Anthropic-compatible API)
2. **Google Gemini** (via LiteLLM Proxy)
3. **OpenAI** (via LiteLLM Proxy)
4. **ZhipuAI / GLM** (via LiteLLM Proxy)
5. **Groq** (via LiteLLM Proxy)
6. **Custom** (Use any model supported by LiteLLM)

The tool will automatically:
1. Install `litellm` if missing.
2. Ask for your API Key (if not set in env vars).
3. Start a local proxy server.
4. Launch `claude` connected to that proxy.

## 📋 Prerequisites
- **Node.js & npm** (for Claude Code)
- **Python 3** & **pip** (for LiteLLM)

## 🤝 Supported Models
Since this uses LiteLLM, you can theoretically use [any of the 100+ supported providers](https://docs.litellm.ai/docs/providers) including:
- Ollama (Local models)
- Azure OpenAI
- AWS Bedrock
- Hugging Face
- Cohere
- etc.

Select option **6) Custom** to manually specify a model string (e.g., `ollama/llama3`).
