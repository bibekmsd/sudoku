import 'package:flutter/material.dart';
import 'package:practise_flutter/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  // const SettingsPage({super.key});
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
            alignment: Alignment.topLeft,
            child: SwitchListTile(
              title: const Text("Theme"),
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                });
              },
              secondary: const Icon(Icons.nightlight_outlined),
            )),
      ]),
    );
  }
}
