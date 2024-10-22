import 'package:flutter/material.dart';
import 'package:rebuilder_docs/main.dart';
import 'documentation.dart';

final indexRM = RM.inject(() => 0);

class DocumentationUI extends UI {
  void _updateCurrentIndex(int index) =>
      indexRM.state = index.clamp(0, documentations().length - 1);

  void _goForward() => _updateCurrentIndex(indexRM.state + 1);

  void _goBack() => _updateCurrentIndex(indexRM.state - 1);

  @override
  Widget build(BuildContext context) {
    final docs = documentations(); // Cached list of documentations
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(8.0), // Add some padding
          child: Text(
            docs[indexRM.state].name,
            style: TextStyle(color: Colors.white, fontSize: 20), // Adjust font size as needed
          ),
        ),
        toolbarHeight: 80, // Increase the height of the AppBar
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                settings().materialColor.shade800,
                settings().materialColor.shade300,
                settings().materialColor.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start, // Optional: Align text to the start
                  children: [
                    Icon(
                      Icons.description, // Replace with the desired icon
                      color: Colors.white,
                      size: 48.0, // Adjust size as needed
                    ),
                    SizedBox(height: 8.0), // Add space between the icon and text
                    Text(
                      'States Rebuilder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ...ListTile.divideTiles(
                      context: context,
                      tiles: docs.map(
                        (doc) {
                          return ListTile(
                            title: Text(doc.name, style: TextStyle(color: Colors.white)),
                            onTap: () {
                              _updateCurrentIndex(docs.indexOf(doc));
                              navigator.back();
                            },
                          );
                        },
                      ).toList(),
                    ).toList(),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  navigator.to(SettingsPage());
                },
                icon: Icon(Icons.settings),
                label: Text('Settings').pad(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  textStyle: TextStyle(fontSize: 20),
                ),
              ).pad(),
            ],
          ),
        ),
      ),
      body: docs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.lightBlueAccent.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          docs[indexRM.state].name, // Title
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        docs[indexRM.state].content, // Content
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: indexRM.state > 0 ? _goBack : null,
                            child: Text('Back'),
                          ),
                          ElevatedButton(
                            onPressed: indexRM.state < docs.length - 1 ? _goForward : null,
                            child: Text('Next'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
