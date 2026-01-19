# 🎮 Modular & Reusable Game Menu System (GameMaker)

## 📖 Description
This project implements a **modular and reusable game menu system**, designed to be easily adapted to different types of games without rewriting the menu logic from scratch.

The menu is built around **enumerated pages and element types**, allowing each menu screen to be dynamically created and extended. Pages such as *Main Menu*, *Settings*, *Audio*, *Graphics*, *Difficulty*, *Controls*, and *Pause Menu* are defined independently, promoting scalability and maintainability.

---

## 🎯 Objective
The main objectives of this project are:
- Provide a flexible base menu system for games
- Allow easy creation and modification of menu pages
- Centralize input handling and navigation logic
- Support multiple menu element types (buttons, sliders, toggles, etc.)
- Avoid code duplication when creating new menus

---

## 🧩 Features
- Page-based menu navigation using enumerations
- Centralized definition of menu pages
- Support for multiple menu element types:
  - Script execution
  - Page transitions
  - Sliders (e.g. volume control)
  - Multiple-choice options (shift)
  - Toggle options (on/off)
  - Key rebinding inputs
- Fully reusable menu structure
- Keyboard navigation support
- Resolution and window mode settings
- Audio control (master, music, sound effects)

---

## 🧠 Menu Architecture

### Menu Pages Enumeration
Menu pages are defined using an enumeration, allowing safe and readable navigation between screens:
- Main Menu
- New Game
- Settings
- Audio
- Difficulty
- Graphics
- Controls
- Pause Menu
- Save / Load
- Exit Game

---

### Menu Element Types
Each menu item is defined by its **type**, which determines its behavior:
- `script_runner` – Executes a function or script
- `page_transfer` – Switches to another menu page
- `slider` – Continuous values (e.g. volume from 0 to 1)
- `shift` – Discrete options (e.g. difficulty levels)
- `toggle` – On/Off options (e.g. fullscreen/windowed)
- `input` – Key rebinding system

---

## ⌨️ Input Handling
- Global navigation keys are defined once and reused across the entire menu system
- Supports directional navigation and confirmation keys
- Includes key reassignment functionality through the Controls menu

---

## 🚀 Extensibility
New menu pages or elements can be added by:
1. Defining a new menu page in the enumeration
2. Creating a new page using the menu creation function
3. Adding elements with the desired behavior

No changes to the core menu logic are required.

---

## 🛠️ Technologies Used
- Engine: GameMaker Studio
- Language: GameMaker Language (GML)
- Paradigm: Modular and Data-Driven Design

---

## 👨‍💻 Author
**Matheus Feliciano do Nascimento**  
Systems Analysis and Development Graduate  
Game systems and software development enthusiast

---

## 📄 License
This project is licensed under the MIT License.  
You are free to use, modify, and adapt it for personal or commercial projects.
