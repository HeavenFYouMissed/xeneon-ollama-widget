# ⚡ Quick Setup Guide

## 🎯 For First-Time Users

### 1️⃣ Install Ollama
```
1. Go to https://ollama.com
2. Download the installer for your OS
3. Run the installer
4. Open terminal/command prompt
5. Run: ollama pull llama2
```

### 2️⃣ Start Ollama with CORS
**Windows:**
- Double-click `start-ollama-widget.bat`
- Leave the window open

**Mac/Linux:**
```bash
OLLAMA_ORIGINS=* ollama serve
```

### 3️⃣ Open the Widget
- **For Browser:** Open `redteam.html` or `ollamasoft.html` in your browser
- **For Xeneon Edge:** Load the HTML file into your widget system

### 4️⃣ Test Connection
1. Widget should show "Loading models..." in the dropdown
2. After a moment, you'll see your models listed
3. Type a message and hit SEND
4. Done! 🎉

## ❓ Common Issues

### "Ollama dead" message
- Make sure you ran `start-ollama-widget.bat` first
- Check that Ollama is installed: Open terminal and type `ollama`
- Try restarting the batch file

### No models in dropdown
- Run: `ollama pull llama2` in terminal
- Refresh the widget page

### Can't connect from Xeneon Edge
- Make sure Ollama is running with CORS enabled
- Check your PC firewall isn't blocking port 11434
- Try accessing `http://127.0.0.1:11434` in a browser - should show "Ollama is running"

### Virtual keyboard not showing (Red Team widget)
- Click inside the text input area
- The keyboard should slide up from bottom

## 🎨 Customization Tips

### Red Team Widget:
1. Click ⚙️ (settings button, bottom-right)
2. Try different tabs:
   - **BG:** Upload a cool cyberpunk wallpaper
   - **Colors:** Match your RGB setup
   - **Glass:** Adjust transparency and blur
   - **Prompt:** Change AI personality

### Best Backgrounds:
- Dark cyberpunk scenes
- Neon cityscapes
- Abstract tech patterns
- High contrast images work best with the glass effects

### Recommended Models:
- **llama2** - Great all-rounder
- **mistral** - Fast and smart
- **codellama** - For coding help
- **dolphin-mixtral** - Uncensored responses

## 📊 Model Commands

```bash
# List available models
ollama list

# Pull a new model
ollama pull llama2
ollama pull mistral
ollama pull codellama

# Remove a model
ollama rm <model-name>

# See model info
ollama show llama2
```

## 🔥 Pro Tips

1. **Save Your Theme:** All Red Team customizations auto-save!
2. **Multiple Personalities:** Switch between prompt presets for different tasks
3. **Keyboard Shortcuts:** 
   - Enter = Send message
   - Shift+Enter = New line
4. **Clear Chat:** Hit the Clear button to start fresh
5. **Model Switching:** Change models mid-conversation
6. **Background Images:** Use 1920x1080 or higher for best quality

## 🚀 Next Level

### Host the widget online:
1. Upload HTML files to GitHub Pages or similar
2. Keep Ollama running on your local PC
3. Access widgets from any device on your network

### Network Access:
To access from other devices on your network, modify the batch file:
```batch
set OLLAMA_HOST=0.0.0.0:11434
set OLLAMA_ORIGINS=*
ollama serve
```
Then use your PC's IP address (e.g., `http://192.168.1.100:11434`) in the widget.

## 🎮 For Corsair Xeneon Edge Users

1. Make sure your PC and monitor are on the same network
2. Run `start-ollama-widget.bat` on your PC
3. Load the HTML file into your Xeneon Edge widget system
4. The widget will connect to your PC's Ollama instance

## 💾 Backup Your Settings

Red Team settings are in localStorage. To backup:
1. Open browser console (F12)
2. Run: `console.log(localStorage)`
3. Copy the values to save your theme

---

Need help? Check the main README.md or open an issue on GitHub!
