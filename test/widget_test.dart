import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:womensday/core/theme/sakura_colors.dart';

void main() {
  test('палитра сакуры задана', () {
    expect(SakuraColors.sakura, const Color(0xFFE85A8C));
    expect(SakuraColors.cream, const Color(0xFFFFF7F4));
  });
}
