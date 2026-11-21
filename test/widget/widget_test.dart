import 'package:al_falah/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('starts on the Arabic Al-Falah home screen', (tester) async {
    await tester.pumpWidget(const AlFalahApp());

    expect(find.text('الفلاح'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('uses Arabic and right-to-left layout', (tester) async {
    await tester.pumpWidget(const AlFalahApp());

    final context = tester.element(find.text('الفلاح'));
    expect(Localizations.localeOf(context), const Locale('ar'));
    expect(Directionality.of(context), TextDirection.rtl);
  });
}
