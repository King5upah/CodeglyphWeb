import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'highlighter.dart';

class CodeglyphView extends StatelessWidget {
  final String code;
  final String language;
  final CodeglyphTheme theme;

  const CodeglyphView({
    super.key,
    required this.code,
    this.language = 'swift',
    this.theme = CodeglyphTheme.voidCentury,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: theme.glowColor.withValues(alpha: 0.3),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderBar(context),
          _buildCodeContent(),
        ],
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.headerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(11),
          topRight: Radius.circular(11),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.archive, size: 14, color: theme.accentColor),
          const SizedBox(width: 8),
          Text(
            language.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: theme.secondaryTextColor,
            ),
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Copied to clipboard',
                      style: TextStyle(fontFamily: 'monospace'),
                    ),
                    backgroundColor: theme.headerColor,
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: theme.borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              child: Icon(Icons.copy, size: 14, color: theme.secondaryTextColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SelectableText.rich(
          TextSpan(
            children: SyntaxHighlighter.highlight(code, language, theme),
          ),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'monospace',
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
