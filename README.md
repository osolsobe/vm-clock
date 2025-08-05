# VMCLOCK - Garmin Connect IQ Watchface

[![Connect IQ](https://img.shields.io/badge/Connect%20IQ-Compatible-blue)](https://developer.garmin.com/connect-iq/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Garmin](https://img.shields.io/badge/Garmin-Instinct%20%7C%20Fenix%20%7C%20Venu-orange)](https://www.garmin.com/)

Minimalist watchface for Garmin watches with Czech-inspired design and dual display modes.

## 🎯 Features

- **Two display modes:**
  - **Text Mode:** "Je čas na bezčasí" (Time for timelessness) - motivational text
  - **Falconer Mode:** Graphical display with Czech symbols
- **Responsive design** - automatically adapts to display size
- **Battery optimization** - special sleep mode rendering
- **Universal compatibility** - supports 50+ Garmin devices

## 📱 Supported Devices

### Instinct Series

- Instinct 2, 2S, 2X
- Instinct 3 AMOLED (45mm, 50mm)
- Instinct 3 Solar (45mm)
- Instinct Crossover
- Instinct E (40mm, 45mm)

### Fenix Series

- Fenix 5 Plus, 5S Plus, 5X Plus
- Fenix 6, 6 Pro, 6S, 6S Pro, 6X Pro
- Fenix 7, 7 Pro, 7S, 7S Pro, 7X, 7X Pro
- Fenix 8 (43mm, 47mm)
- Fenix 8 Solar (47mm, 51mm)
- Fenix E

### Other Devices

- Venu, Venu 2, Venu 2 Plus, Venu 2S, Venu 3, Venu 3S
- Forerunner series (55, 165, 245, 255, 265, 570, 645M, 745, 945, 955, 965, 970)
- MARQ series (all models)
- Approach S50, S70 (42mm, 47mm)
- D2 Air, D2 Air X10, D2 Mach 1
- Descent series (G1, G2, Mk2, Mk2S, Mk3)
- Enduro, Enduro 3
- Epix 2, Epix 2 Pro (all sizes)
- Vívoactive 4, 4S, 5

## 🚀 Installation

### From Connect IQ Store

1. Open **Garmin Connect IQ Store** on your watch or mobile app
2. Search for **"VMCLOCK"**
3. Download and install the watchface
4. Set as active watchface

### Manual Installation (for developers)

1. Download the `.prg` file from [Releases](../../releases)
2. Copy to `GARMIN/APPS` folder on your watch
3. Sync with Garmin Connect

## ⚙️ Settings

You can configure the watchface directly on your watch or via Garmin Connect app:

1. **Display Mode:**
   - **Text - Timelessness:** Minimalist text display
   - **Falconer:** Graphical mode with Czech motif

### Changing Settings

- **On Watch:** Hold UP button → Watchface Settings → VMCLOCK
- **In App:** Garmin Connect → My Device → Watch Faces → VMCLOCK → Settings

## 🛠️ Development

### Requirements

- Connect IQ SDK 4.2.0+
- Visual Studio Code with Monkey C extension
- Garmin device or simulator

### Building the Project

```bash
# Clone repository
git clone https://github.com/osolsobe/vm-clock.git
cd vm-clock

# Open in VS Code
code .

# Build (Ctrl/Cmd + Shift + P)
# → "Monkey C: Build for Device"
```

### Project Structure

```
VMCLOCK/
├── source/
│   ├── VMCLOCKApp.mc          # Main application class
│   └── VMCLOCKView.mc         # Watchface logic and rendering
├── resources/
│   ├── drawables/             # Images and icons
│   ├── layouts/               # Layout definitions
│   ├── settings/              # Settings and properties
│   └── strings/               # Localization
├── manifest.xml               # Application configuration
└── monkey.jungle              # Build configuration
```

## 🎨 Customization

### Change Text

Edit the file `resources/strings/strings.xml`:

```xml
<string id="TextMode">Your custom text</string>
```

### Change Image

Replace the file `resources/drawables/sokolnik180.svg` with your own SVG image.

### Add New Mode

1. Add constant to `VMCLOCKView.mc`
2. Extend `switch` statement in `onUpdate()`
3. Implement new draw function

## 🔧 Technical Details

- **API Level:** 2.4.0+ (compatibility with older devices)
- **Programming Language:** Monkey C
- **Optimizations:** Image caching, responsive font scaling
- **Battery:** Simplified rendering in sleep mode

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! If you have ideas for improvements:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Contact

**Author:** osolsobe  
**GitHub:** [@osolsobe](https://github.com/osolsobe)  
**Repository:** [vm-clock](https://github.com/osolsobe/vm-clock)

## 🙏 Acknowledgments

- Garmin for the Connect IQ platform
- Developer community for inspiration and support
- All testers and users of the application

---

_Made with ❤️ for the Garmin community_
