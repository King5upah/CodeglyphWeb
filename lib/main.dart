import 'package:flutter/material.dart';
import 'src/codeglyph_view.dart';

void main() {
  runApp(const CodeglyphsDemoApp());
}

class CodeglyphsDemoApp extends StatelessWidget {
  const CodeglyphsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeglyphs Web Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF0D0D12),
        ),
        useMaterial3: true,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  final String sampleSwiftCode = '''
import Codeglyphs

struct MyView: View {
    let code = "print('Hello, Grand Line!')"
    
    var body: some View {
        CodeglyphView(code, language: "swift", theme: .voidCentury)
            .frame(height: 200)
    }
}
''';

  final String sampleDartCode = '''
import 'package:flutter/material.dart';
import 'package:codeglyphs/codeglyphs.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeglyphView(
      code: "print('Hello, Grand Line!');",
      language: 'dart',
      theme: CodeglyphTheme.voidCentury,
    );
  }
}
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Codéglyphs 🏴‍☠️📜',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: const Text(
                    'A Poneglyph-inspired code representation engine, now ported to Flutter Web.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 48),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Swift Example',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        CodeglyphView(
                          code: sampleSwiftCode.trim(),
                          language: 'swift',
                        ),
                        const SizedBox(height: 48),
                        const Text(
                          'Dart Example',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        CodeglyphView(
                          code: sampleDartCode.trim(),
                          language: 'dart',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
