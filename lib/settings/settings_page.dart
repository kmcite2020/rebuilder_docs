import 'package:rebuilder_docs/main.dart';

import 'package:flutter/material.dart';

import '../documentation/documentation.dart';

class SettingsPage extends UI {
  const SettingsPage({super.key});

  void _toggleEditMode() {
    editMode(!editMode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          ThemeModeDropdown().pad(),
          ColorSwatchDropdown().pad(),
          ElevatedButton.icon(
            onPressed: _toggleEditMode,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                editMode() ? Colors.green : Colors.red, // Change color based on state
              ),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), // Bigger font
              ),
              elevation: MaterialStateProperty.all(10), // Add elevation for shadow
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(settings().borderRadius), // Rounded corners
                  side: BorderSide(
                    color: editMode() ? Colors.greenAccent : Colors.redAccent,
                  ), // Border color based on state
                ),
              ),
            ),
            icon: Icon(
              editMode() ? Icons.check : Icons.edit, // Icon based on edit mode state
              color: Colors.white,
            ),
            label: Column(
              // Use a Row to place icon and text together
              mainAxisAlignment: MainAxisAlignment.center, // Center the contents
              children: [
                Text(
                  editMode() ? 'DISABLE' : 'ENABLE',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  editMode()
                      ? 'You are currently in edit mode. Make changes as needed.'
                      : 'Edit mode is disabled. Changes cannot be made. Thanks',
                  style: TextStyle(fontSize: 16.0, color: Colors.black54), // Style for status text
                  textAlign: TextAlign.center, // Center the status text
                ).pad(),
              ],
            ).pad(),
          ).pad(),
          ElevatedButton(
            onPressed: () {
              documentations(Documentation());
            },
            child: 'Add Documentation'.text(),
          ).pad()
        ],
      ),
    );
  }
}

class ColorSwatchDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: settings().materialColor,
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          hint: Text("SELECT COLOR SWATCH"),
          dropdownColor: Theme.of(context).cardColor, // Match dropdown background color
          items: Colors.primaries
              .map(
                (color) => DropdownMenuItem(
                  value: color,
                  child: _buildColorMenuItem(color),
                ),
              )
              .toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              settings(
                settings().copyWith(materialColor: newValue),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildColorMenuItem(Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          color: color,
        ),
        SizedBox(width: 8),
        Text(color.colorName.toString().toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class ThemeModeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ThemeMode>(
          value: settings().themeMode,
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          hint: Text("SELECT THEME MODE"),
          dropdownColor: Theme.of(context).cardColor, // Match dropdown background color
          items: [
            DropdownMenuItem(
              value: ThemeMode.light,
              child: _buildMenuItem(context, Icons.wb_sunny, "LIGHT", Colors.orange),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: _buildMenuItem(context, Icons.nights_stay, "DARK", Colors.blueGrey),
            ),
            DropdownMenuItem(
              value: ThemeMode.system,
              child:
                  _buildMenuItem(context, Icons.settings_system_daydream, "SYSTEM", Colors.green),
            ),
          ],
          onChanged: (ThemeMode? newValue) {
            if (newValue != null) {
              settings(settings().copyWith(themeMode: newValue));
            }
          },
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
