import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:rebuilder_docs/main.dart';

final documentationPages = [];
Future<void> initializePages() async {
  Future<String> _(String path) => rootBundle.loadString('assets/$path.md');

  final listOfPages = [
    _('CHANGELOG'),
  ];
  for (final page in listOfPages) {
    final x = await page;
    documentationPages.add(x);
  }
}

final indexRM = RM.inject(() => 0);

class HomePage extends UI {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // to(SettingsPage());
            },
            icon: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Markdown(
        data: documentationPages[indexRM.state],
      ),
      floatingActionButton: FilledButton(
        onPressed: () {
          indexRM.state = 3;
        },
        child: '->'.text(),
      ),
    );
  }
}
