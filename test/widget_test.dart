import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hometrour/main.dart';

void main() {
  testWidgets('home keeps city hub and opens Chongqing as second-level page', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('精选城市'), findsOneWidget);
    expect(find.text('枣庄'), findsOneWidget);
    expect(find.text('上海'), findsOneWidget);
    expect(find.text('成都'), findsOneWidget);
    expect(find.text('西安'), findsOneWidget);
    expect(find.text('重庆'), findsOneWidget);

    await tester.ensureVisible(find.text('重庆'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('重庆'));
    await tester.pumpAndSettle();

    expect(find.text('首页'), findsOneWidget);
    expect(find.text('景点'), findsOneWidget);
    expect(find.text('美食'), findsOneWidget);
    expect(find.text('旅游'), findsOneWidget);
    expect(find.text('山城重庆'), findsOneWidget);
  });

  testWidgets('other city cards still show detail sheet', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('枣庄'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('枣庄'));
    await tester.pumpAndSettle();

    expect(find.textContaining('台儿庄古城'), findsOneWidget);
  });

  testWidgets('Chongqing route detail renders mapped route page', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('重庆'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('重庆'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.map_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('详情').first);
    await tester.pumpAndSettle();

    expect(find.text('地图路线示意图'), findsOneWidget);
    expect(find.text('建议时长 约8-9小时'), findsOneWidget);
  });
}
