import 'package:flutter/material.dart';
import 'theme.dart';

class HighlightRule {
  final RegExp pattern;
  final Color Function(CodeglyphTheme) color;

  HighlightRule({required String pattern, required this.color})
      : pattern = RegExp(pattern, multiLine: true);
}

class SyntaxHighlighter {
  static List<TextSpan> highlight(String code, String language, CodeglyphTheme theme) {
    List<HighlightRule> rules = language.toLowerCase() == 'dart' ? dartRules() : swiftRules();
    
    // We need to parse the string using regexes and build a list of TextSpans.
    // Since regex matches can overlap or leave gaps, we iterate character by character
    // or parse sequentially.
    // A simpler approach for a basic highlighter: tokenize the text using a combined regex,
    // but the iOS version just applies colors over ranges. 
    // In Flutter, we must build sequential TextSpans.
    
    // Convert rules into a single parsing strategy. 
    // For simplicity and matching iOS functionality, we will find all matches for all rules,
    // sort them by start index, and map them to text spans, filling the gaps with default color.
    
    List<_MatchResult> matches = [];
    for (var rule in rules) {
      for (var match in rule.pattern.allMatches(code)) {
        matches.add(_MatchResult(match.start, match.end, rule.color(theme)));
      }
    }
    
    // Sort matches by start position. If overlap, prioritize earlier rules.
    matches.sort((a, b) => a.start.compareTo(b.start));
    
    // Filter overlaps
    List<_MatchResult> nonOverlappingMatches = [];
    int currentEnd = 0;
    for (var match in matches) {
      if (match.start >= currentEnd) {
        nonOverlappingMatches.add(match);
        currentEnd = match.end;
      }
    }
    
    List<TextSpan> spans = [];
    int lastEnd = 0;
    
    for (var match in nonOverlappingMatches) {
      if (match.start > lastEnd) {
        // Gap
        spans.add(TextSpan(
          text: code.substring(lastEnd, match.start),
          style: TextStyle(color: theme.textColor),
        ));
      }
      // Highlighted text
      spans.add(TextSpan(
        text: code.substring(match.start, match.end),
        style: TextStyle(color: match.color),
      ));
      lastEnd = match.end;
    }
    
    if (lastEnd < code.length) {
      spans.add(TextSpan(
        text: code.substring(lastEnd),
        style: TextStyle(color: theme.textColor),
      ));
    }
    
    return spans;
  }

  static List<HighlightRule> swiftRules() {
    return [
      HighlightRule(
        pattern: r'\b(class|struct|enum|extension|protocol|func|var|let|if|else|guard|return|import|public|private|init|try|await|async|throws|catch|do)\b',
        color: (t) => t.accentColor,
      ),
      HighlightRule(
        pattern: r'\b[A-Z][a-zA-Z0-9_]*\b',
        color: (t) => t.typeColor,
      ),
      HighlightRule(
        pattern: r'".*?"',
        color: (t) => t.stringColor,
      ),
      HighlightRule(
        pattern: r'//.*',
        color: (t) => t.commentColor,
      ),
      HighlightRule(
        pattern: r'\b\d+\b',
        color: (t) => t.numberColor,
      ),
    ];
  }

  static List<HighlightRule> dartRules() {
    return [
      HighlightRule(
        pattern: r'\b(class|abstract|extends|implements|with|mixin|void|int|double|String|bool|List|Map|return|if|else|var|final|const|dynamic|late|import|package|as|show|hide|async|await|Future|Stream|yield)\b',
        color: (t) => t.accentColor,
      ),
      HighlightRule(
        pattern: r'\b[A-Z][a-zA-Z0-9_]*\b',
        color: (t) => t.typeColor,
      ),
      HighlightRule(
        pattern: r'@[a-zA-Z]+\b',
        color: (t) => t.typeColor,
      ),
      HighlightRule(
        pattern: r'''["'].*?["']''',
        color: (t) => t.stringColor,
      ),
      HighlightRule(
        pattern: r'//.*',
        color: (t) => t.commentColor,
      ),
      HighlightRule(
        pattern: r'\b\d+\b',
        color: (t) => t.numberColor,
      ),
    ];
  }
}

class _MatchResult {
  final int start;
  final int end;
  final Color color;

  _MatchResult(this.start, this.end, this.color);
}
