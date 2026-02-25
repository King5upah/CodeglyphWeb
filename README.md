# Codéglyphs 🏴‍☠️📜 (Flutter & Web)

**Codéglyphs** is a Poneglyph-inspired code representation engine, now ported to **Flutter**. Designed specifically for AI agents, technical documentation, and cross-platform apps, it brings clarity and "historical significance" to your code snippets on Web, iOS, and Android.

![Codéglyphs Preview](screenshots/preview.webp)

## Features
- **Void Century Theme:** Experience the legendary **Void Century** aesthetic (Dark/Blue) out of the box.
- **Native Flutter:** Built entirely with pure Flutter widgets (`Container`, `SelectableText`) for seamless integration.
- **Cross-Platform:** Write once, run anywhere. Works beautifully on Flutter Web.
- **Syntax Highlighting:** Custom lightweight RegExp-based highlighting out-of-the-box for **Swift** and **Dart**.
- **One-Tap Copy:** Built-in clipboard management with a stylish SnackBar success prompt.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:codeglyph_web/src/codeglyph_view.dart';
import 'package:codeglyph_web/src/theme.dart';

class MySnippet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CodeglyphView(
      code: "print('Hello, Grand Line!');",
      language: 'dart',
      theme: CodeglyphTheme.voidCentury,
    );
  }
}
```

## Architecture & Internals
Codéglyphs for Flutter is built with simplicity and performance in mind:
- **`CodeglyphTheme`**: A flexible data structure allowing for modular visuals without breaking the engine.
- **`SyntaxHighlighter`**: Uses Dart's `RegExp` engine to build `TextSpan` lists linearly, ensuring O(N) highlighting performance.
- **`CodeglyphView`**: Uses `SelectableText.rich` allowing users to naturally interact with and scroll through code snippets on the Web.

## The Lore
In the world of code, information is often lost in translation. **Codéglyphs** ensures that your logic remains as durable and striking as the ancient stones of the Void Century. Only those with the "Voice of All Things" (or a good AI model) can truly appreciate its clarity.

## License
MIT
