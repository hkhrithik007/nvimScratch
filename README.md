
***

# Neovim Scratch IDE Configuration  

This repository contains my custom Neovim configuration built from scratch to provide a lightweight, powerful IDE experience. It includes language servers, debugging, file navigation, and various developer-friendly enhancements.

***

## Features  
- Language Server Protocol (LSP) integration (including Java)  
- Debugging support  
- File explorer and fuzzy find  
- Code actions and refactoring tools  
- Custom UI improvements  

***

## Installation  

### Prerequisites  
- Neovim (v0.8 or later recommended)  
- Git  

***

### Setup  

1. Clone this repo to your local machine:  
   ```bash  
   git clone https://github.com/hkhrithik007/nvimScratch.git ~/.config/nvim  
   ```

2. Install required dependencies and plugins (some depend on OS-specific steps below)  

***

### OS-Specific Instructions  

#### macOS  
- Ensure Neovim is installed via Homebrew:  
  ```bash  
  brew install neovim  
  ```
- Install language servers using Homebrew or npm/pip depending on your tooling  
- Install `lldb` for debugging (comes with Xcode Command Line Tools)  

#### Linux  
- Install Neovim via your package manager (e.g., `sudo apt install neovim`)  
- Install language servers as per distro instructions or via npm/pip  
- Install `lldb` or another debugger depending on your setup  

#### Windows  
- Install Neovim via [official releases](https://github.com/neovim/neovim/releases) or package manager like scoop or winget  
- Set up language servers using npm/pip or your preferred method  
- For debugging, install Windows-compatible debuggers (e.g., `lldb`, `gdb`)  

***

### Launch Neovim  
Open Neovim normally:  
```bash  
nvim  
```
On first launch, the plugin manager will install required plugins automatically.

***

## Usage  

- Supported languages will have automatic syntax highlighting, autocompletion, and linting  
- Use the integrated debugger for supported languages (e.g., Java shown in demo)  
- Use fuzzy finder to quickly navigate files, symbols, and references  
- Trigger code actions with provided shortcuts (refer to config key bindings)  

***

## Customization  

Feel free to modify the config files inside `~/.config/nvim` to suit your preferences.

***

## Contributions  

Pull requests, suggestions, and issues are welcome!

***

## License  

MIT License  

***

Screenshot

<img width="1440" height="900" alt="Screenshot 2025-10-07 at 2 38 46 PM" src="https://github.com/user-attachments/assets/7ce5246d-3bb9-4470-a60e-73f80cd0419b" />

