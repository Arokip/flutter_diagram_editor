import 'package:diagram_editor/src/model/link_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LinkStyle', () {
    test('defaults', () {
      const style = LinkStyle();
      expect(style.lineType, LineType.solid);
      expect(style.arrowType, ArrowType.none);
      expect(style.backArrowType, ArrowType.none);
      expect(style.arrowSize, 5);
      expect(style.backArrowSize, 5);
      expect(style.lineWidth, 1);
      expect(style.color, Colors.black);
    });

    test('getEndShortening returns 0 for ArrowType.none', () {
      const style = LinkStyle();
      expect(style.getEndShortening(ArrowType.none), 0);
    });

    test('getEndShortening returns positive for arrow types', () {
      const style = LinkStyle(arrowSize: 10);
      expect(
        style.getEndShortening(ArrowType.arrow),
        greaterThan(0),
      );
      expect(
        style.getEndShortening(ArrowType.pointedArrow),
        greaterThan(0),
      );
    });

    test('getLinePath returns non-empty path for solid', () {
      const style = LinkStyle();
      final path = style.getLinePath(
        Offset.zero,
        const Offset(100, 0),
        1,
      );
      // A horizontal line has width > 0 even if height is 0
      expect(path.getBounds().width, greaterThan(0));
    });

    test('getArrowTipPath returns empty for ArrowType.none', () {
      const style = LinkStyle();
      final path = style.getArrowTipPath(
        ArrowType.none,
        5,
        Offset.zero,
        const Offset(100, 0),
        1,
      );
      expect(path.getBounds().isEmpty, isTrue);
    });
  });

  group('LinkStyle serialization', () {
    test('round-trip with enum name strings', () {
      const original = LinkStyle(
        lineType: LineType.dashed,
        arrowType: ArrowType.pointedArrow,
        backArrowType: ArrowType.circle,
        arrowSize: 8,
        backArrowSize: 6,
        lineWidth: 2,
        color: Colors.red,
      );

      final json = original.toJson();
      expect(json['line_type'], 'dashed');
      expect(json['arrow_type'], 'pointedArrow');

      final restored = LinkStyle.fromJson(json);
      expect(restored.lineType, original.lineType);
      expect(restored.arrowType, original.arrowType);
      expect(restored.backArrowType, original.backArrowType);
      expect(restored.arrowSize, original.arrowSize);
      expect(restored.backArrowSize, original.backArrowSize);
      expect(restored.lineWidth, original.lineWidth);
    });

    test('color serialization round-trip', () {
      const original = LinkStyle(color: Color(0xFF42A5F5));
      final json = original.toJson();
      final restored = LinkStyle.fromJson(json);
      expect(restored.color.toARGB32(), original.color.toARGB32());
    });

    test('color with transparency round-trip', () {
      const original = LinkStyle(color: Color(0x80FF0000));
      final json = original.toJson();
      final restored = LinkStyle.fromJson(json);
      expect(restored.color.toARGB32(), original.color.toARGB32());
    });
  });

  group('LinkStyle equality', () {
    test('identical instances are equal', () {
      const a = LinkStyle();
      const b = LinkStyle();
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('same parameters are equal', () {
      const a = LinkStyle(
        arrowType: ArrowType.arrow,
        lineWidth: 2,
        color: Colors.red,
      );
      const b = LinkStyle(
        arrowType: ArrowType.arrow,
        lineWidth: 2,
        color: Colors.red,
      );
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('different parameters are not equal', () {
      const a = LinkStyle(arrowType: ArrowType.arrow);
      const b = LinkStyle(arrowType: ArrowType.circle);
      expect(a, isNot(equals(b)));
    });

    test('different lineWidth makes styles unequal', () {
      const a = LinkStyle();
      const b = LinkStyle(lineWidth: 2);
      expect(a, isNot(equals(b)));
    });

    test('different color makes styles unequal', () {
      const a = LinkStyle(color: Colors.red);
      const b = LinkStyle(color: Colors.blue);
      expect(a, isNot(equals(b)));
    });
  });

  group('LinkStyle line types', () {
    test('dashed line path is non-empty', () {
      const style = LinkStyle(lineType: LineType.dashed);
      final path = style.getLinePath(
        Offset.zero,
        const Offset(100, 100),
        1,
      );
      expect(path.getBounds().width, greaterThan(0));
    });

    test('dotted line path is non-empty', () {
      const style = LinkStyle(lineType: LineType.dotted);
      final path = style.getLinePath(
        Offset.zero,
        const Offset(100, 100),
        1,
      );
      expect(path.getBounds().width, greaterThan(0));
    });

    test('all arrow types produce paths', () {
      const style = LinkStyle();
      for (final type in ArrowType.values) {
        if (type == ArrowType.none) continue;
        final path = style.getArrowTipPath(
          type,
          5,
          Offset.zero,
          const Offset(100, 100),
          1,
        );
        expect(
          path.getBounds().isEmpty,
          isFalse,
          reason: '$type should produce a non-empty path',
        );
      }
    });
  });
}
