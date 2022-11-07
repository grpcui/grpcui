import 'package:app/pages/server_selection_page.dart';
import 'package:app/pages/service_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:window_location_href/window_location_href.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final location = href;
    final uri = location != null ? Uri.tryParse(location) : null;

    final showAddressPage =
        uri == null || uri.host == 'grpcui.dev' || uri.host == 'app.grpcui.dev';

    return MaterialApp(
      title: 'gRPC UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(0, 48)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(0, 48)),
          ),
        ),
      ),
      home: showAddressPage
          ? const ServerSelectionPage()
          : ServiceSelectionPage(address: uri),
    );
  }
}
