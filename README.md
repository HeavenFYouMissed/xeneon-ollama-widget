# Ollama Corsair Xeneon Edge Widgets

custom AI chat widget designed for the Corsair Xeneon Edge monitor display, connecting to your local Ollama instance.

![Dark Edition]<img width="3397" height="1393" alt="Screenshot 2026-02-06 053710" src="https://github.com/user-attachments/assets/058d9e33-ea12-4a3f-8a1e-4febf85bef20" />
*Red Team Edition - dark Theme customizable by code/background*

![Xeneon keyboard touch]<img width="3397" height="1393" alt="Screenshot 2026-02-06 053005" src="https://github.com/user-attachments/assets/5b16cdd7-f1e9-47e4-afbb-e0e8183595c1" />
*Xeneon*

## 🎨 Widgets

### 1. **Dark Edition** (`redteam.html`)
- 🔥 Ultra-customizable Dark Edition theme
- ⚙️ Full glass morphism controls
- 🎨 Custom color schemes
- 🖼️ Custom backgrounds and logos
- ⌨️ Virtual keyboard for touchscreen
- 🎭 Multiple AI personality presets
- 💾 All settings persist via localStorage

## 📋 Requirements

- **Ollama** - [Download here](https://ollama.com)
- **Corsair Xeneon Edge Monitor** (or any device with iframe support)
- **Windows PC** (for the batch script)

## 🚀 Quick Start

### Step 1: Install Ollama

#### Windows (PowerShell)
```powershell
# Download and install Ollama
winget install Ollama.Ollama

# Or manually download from: https://ollama.com/download/windows
```

#### Linux
```bash
# One-line install script
curl -fsSL https://ollama.com/install.sh | sh

# Or manual install (Debian/Ubuntu)
curl -fsSL https://ollama.com/install.sh | sh
```

#### macOS
```bash
# Download and install from website
# Visit: https://ollama.com/download/mac

# Or use Homebrew
brew install ollama
```

#### Verify Installation
```bash
# Check Ollama version
ollama --version

# Should output something like: ollama version is 0.1.x
```

### Step 2: Pull AI Models

```bash
# Recommended starter models (pick at least one):

# Llama 2 (7B) - Good all-rounder, fast
ollama pull llama2

# Llama 3.2 (3B) - Smaller, very fast
ollama pull llama3.2

# Mistral (7B) - Excellent for coding
ollama pull mistral

# CodeLlama (7B) - Specialized for code
ollama pull codellama

# Gemma 2 (2B) - Tiny and fast
ollama pull gemma2:2b

# Check what models you have
ollama list
```

### Step 2: Start Ollama with CORS

**Windows - Simply run the batch file:**
```
start-ollama-widget.bat
```

This will:
- ✅ Check if Ollama is installed
- ✅ Kill any existing Ollama process
- ✅ Enable CORS for widget access (`OLLAMA_ORIGINS=*`)
- ✅ Start Ollama server on `http://127.0.0.1:11434`

**Manual Start (Any Platform):**

```bash
# Windows PowerShell
$env:OLLAMA_ORIGINS="*"; ollama serve

# Windows CMD
set OLLAMA_ORIGINS=*
ollama serve

# Linux/macOS
OLLAMA_ORIGINS=* ollama serve
```

**Verify Ollama is Running:**
```bash
# Check if Ollama server is responding
curl http://127.0.0.1:11434/api/tags

# Should return JSON list of your models
```

### Step 3: Load the Widget

#### For Corsair Xeneon Edge:
1. Copy `redteam.html` or `ollamasoft.html` to a web-accessible location
2. Add the widget to your Xeneon Edge display
3. The widget will auto-connect to Ollama

#### For Browser Testing:
1. Simply open `redteam.html` or `ollamasoft.html` in your browser
2. The widget should connect automatically

## ⚙️ Configuration

### Dark Edition Widget Settings

Access settings via the ⚙️ button (bottom right):

![Settings Panel]<img width="3397" height="1382" alt="Screenshot 2026-02-06 053637" src="https://github.com/user-attachments/assets/eb4b2999-1ff9-433e-ab44-fca904cd054d" />
*Full Customization Settings Panel*

**Background Tab:**
- Upload custom images or paste URLs
- Supports both local and remote images

**ASCII Tab:**
- Add custom ASCII art headers
- Gallery of preset designs

**Colors Tab:**
- Customize all theme colors
- Change font family and size
- Pick from color picker or enter hex codes

**Logo Tab:**
- Add custom header logo
- Supports URL or file upload

**Prompt Tab:**
- Customize AI personality
- Preset prompts included:
  - 🔥 Red-Team Savage
  - 💻 Code Helper
  - 📖 Storyteller
  - ⚡ Direct Mode

### Widgets

- **Model Selection:** Top-right dropdown
- **Clear Chat:** Button in header
- **Auto-save:** All settings saved to localStorage

## 🔧 Troubleshooting

### "Ollama dead" Error

**Solution:**
1. Make sure Ollama is installed: `ollama --version`
2. Run `start-ollama-widget.bat` (Windows) or manually start with CORS
3. Check that port 11434 is not blocked by firewall
4. Test API connection: `curl http://127.0.0.1:11434/api/tags`

### Cannot Connect / CORS Error

**Solution:**
1. Stop any running Ollama instances:
   ```bash
   # Windows
   taskkill /F /IM ollama.exe
   
   # Linux/macOS
   killall ollama
   ```
2. Use the provided `start-ollama-widget.bat` script
3. Make sure `OLLAMA_ORIGINS=*` is set before starting
4. Verify CORS is enabled: check terminal output for "OLLAMA_ORIGINS" variable

### Models Not Loading

**Solution:**
1. Check installed models:
   ```bash
   ollama list
   ```
2. If no models, pull one:
   ```bash
   ollama pull llama2
   # or
   ollama pull llama3.2
   ```
3. Refresh the widget

### Widget Not Working in iFrame

**Solution:**
1. Make sure Ollama is started with CORS enabled
2. Check browser console for errors (F12)
3. Ensure the HTML file is served via HTTP (not file://)
4. Test direct connection: Open `http://127.0.0.1:11434` in browser

### Testing Your Setup

**Run these commands to verify everything:**
```bash
# 1. Check Ollama is installed
ollama --version

# 2. Check models are available
ollama list

# 3. Check server is running
curl http://127.0.0.1:11434/api/tags

# 4. Test a simple prompt
ollama run llama2 "Hello, how are you?"
```

## 🌐 Advanced Commands

### Managing Ollama Service

```bash
# Start Ollama server (keeps running in terminal)
ollama serve

# Run a model directly in terminal
ollama run llama2

# Run with a specific prompt
ollama run llama2 "Write a hello world in Python"

# List all downloaded models
ollama list

# Show model information
ollama show llama2

# Delete a model (free up space)
ollama rm llama2

# Pull a specific model version
ollama pull llama2:13b

# Update a model to latest version
ollama pull llama2
```

### Model Management

```bash
# See all available models at ollama.com/library
# Popular choices:

# General purpose
ollama pull llama3.2        # Latest Meta model (fast)
ollama pull mistral         # Excellent quality
ollama pull gemma2:2b      # Tiny and fast

# Coding specialized
ollama pull codellama       # Code generation
ollama pull deepseek-coder  # Very good at coding

# Vision models (experimental)
ollama pull llava           # Can analyze images
```

### Performance Tips

```bash
# Use GPU acceleration (if you have NVIDIA GPU)
# Ollama automatically uses GPU if available

# Check GPU usage (Windows)
nvidia-smi

# For faster responses, use smaller models:
ollama pull gemma2:2b       # 2 billion parameters (fast)
ollama pull llama3.2:3b     # 3 billion parameters (balanced)

# For better quality, use larger models:
ollama pull llama2:13b      # 13 billion parameters (slower, better)
ollama pull mistral:7b      # 7 billion parameters (good balance)
```

### Troubleshooting Commands

```bash
# Check if Ollama service is running (Windows)
Get-Process ollama -ErrorAction SilentlyContinue

# Check if port 11434 is in use
netstat -ano | findstr :11434

# Test API directly
curl http://127.0.0.1:11434/api/tags

# Kill all Ollama processes (Windows)
taskkill /F /IM ollama.exe

# Kill all Ollama processes (Linux/macOS)
killall ollama

# Check Ollama logs (Linux/macOS)
journalctl -u ollama -f
```

## 📱 Features

### Dark Edition
- 🎨 Full theme customization
- ⌨️ Touch-friendly virtual keyboard
- 🎭 AI personality presets
- 💾 Persistent settings
- 🖼️ Custom backgrounds
- 🔤 ASCII art headers

## 🤝 Contributing

Feel free to submit issues, fork the repo, and send pull requests!

## 📄 License

MIT License - feel free to use and modify as needed.

## 💡 Tips

- **Virtual Keyboard:** Click the input area in Red Team to show/hide
- **Settings:** Click ⚙️ to access full customization panel
- **Models:** Try different models for different results (`llama2`, `mistral`, `codellama`, etc.)
- **System Prompt:** Customize AI behavior in the Prompt tab
- **Backgrounds:** Use high-res images for best results

## 🎮 Corsair Xeneon Edge Specific

These widgets are optimized for the Corsair Xeneon Edge monitor display system. The HTML is structured to work properly in the monitor's iframe environment with proper CORS handling.

---

**Made with 🔥 for the Corsair Xeneon Edge community**
