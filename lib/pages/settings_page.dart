import 'package:expenses_app/main.dart';
import 'package:expenses_app/widgets/bottom_appbar/bottom_appbar.dart';
import 'package:expenses_app/widgets/fab/fab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  void loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool("isDarkMode") ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  void changeTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = value;
    });
    prefs.setBool("isDarkMode", value);
    var actualThemeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    MyApp.of(context).changeTheme(actualThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: color.background,
        foregroundColor: color.primary,
      ),
      bottomNavigationBar: CustomBottomAppbar(),
      floatingActionButton: CustomFloatingActionButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Dark mode",
                    style: text.titleLarge,
                  ),
                  trailing: Switch(
                    value: isDarkMode,
                    onChanged: changeTheme,
                    activeColor: color.primary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
