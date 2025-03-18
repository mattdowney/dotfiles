# 🚀 Dotfiles & Dev Environment Setup

This repository contains my **dotfiles** and a fully automated **install script** to set up a macOS development environment in minutes.

## 📌 **Installation Instructions**

### **1⃣ Clone the Dotfiles Repo**
```sh
git clone git@github.com:mattdowney/dotfiles.git ~/dotfiles
```

### **2⃣ Run the Install Script**
```sh
bash ~/dotfiles/install.sh
```

### **3⃣ Restart Your Terminal**
```sh
exec zsh
```
Or manually close and reopen your terminal.

---

## ⚡ **What This Installs**
### **System Tools**
- 🍺 **Homebrew** (macOS package manager)
- 🛠 **CLI Tools**: `git`, `gh` (GitHub CLI), `fzf`, `ripgrep`, `wget`, `jq`

### **Development**
- ⚡ **Volta** (for Node.js version management)
- 🟢 **Node.js** (via Volta) + Global npm packages (`pnpm`, `yarn`, `eslint`, `typescript`)
- 🐘 **PHP** (for WordPress & Shopify work)
- 🎠 **Composer** (PHP package manager)

### **Shell & Configs**
- 🎨 **Cursor settings** (symlinked for automatic syncing)
- 🛠 **Git config** (`.gitconfig`)
- 🐛 **Zsh config** (`.zshrc`)
- ⚡ **Oh My Zsh & Plugins**
  - `zsh-autosuggestions` (auto-suggest commands)
  - `zsh-syntax-highlighting` (colorized command syntax)

---

## 📌 **Updating Your Dotfiles**
Whenever you change settings, run:
```sh
cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push
```

---

## 🛠 **Customizing**
### **Adding More Tools**
- Modify `install.sh` to install additional CLI tools or frameworks (e.g., VS Code, Docker).
- Add custom **aliases, functions, and environment variables** to `~/.zshrc`.

### **Changing Cursor Settings**
Modify `settings.json` and run:
```sh
cp ~/Library/Application\ Support/Cursor/User/settings.json ~/dotfiles/
git add settings.json
git commit -m "Update Cursor settings"
git push
```

---

## 🚑 **Troubleshooting**
### **1⃣ "Permission denied" when running the script**
Fix it by making the script executable:
```sh
chmod +x ~/dotfiles/install.sh
```

### **2⃣ Homebrew is asking for a password**
That’s normal—Homebrew requires admin permissions for system-wide installs.

### **3⃣ Symlinked files aren’t updating**
Run:
```sh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
```
This will **re-link everything manually**.

---

## 📌 **Next Steps**
- **Keep your dotfiles updated** by committing changes regularly  
- **Share your setup** with friends who want a similar Mac dev environment  
- **Fork & modify** if you want to create a custom version  

🚀 **This is now a plug-and-play Mac setup! Enjoy.** 🎉