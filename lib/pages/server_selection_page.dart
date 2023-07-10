import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:app/pages/service_selection_page.dart';

class ServerSelectionPage extends StatefulWidget {
  const ServerSelectionPage({super.key});

  @override
  State<ServerSelectionPage> createState() => _ServerSelectionPageState();
}

class _ServerSelectionPageState extends State<ServerSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gRPC UI'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.github),
            onPressed: () {
              launchUrl(
                Uri.parse('https://github.com/grpcui/grpcui/'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final address in _addresses)
            ListTile(
              title: Text(address.toString()),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceSelectionPage(address: address),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

final _addresses = [
  Uri.parse("https://localhost:7016"),
  Uri.parse('https://app.be-woow.com')
];
