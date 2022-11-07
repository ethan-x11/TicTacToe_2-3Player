import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
    _checkVersion();
  }

  void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.snapchat.android",
    );
    final status = await newVersion.getVersionStatus();
    if (status?.canUpdate == true) {
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status!,
        dialogTitle: "Update Available",
        dismissButtonText: "Skip",
        dialogText: "Please update the app from " +
            "${status.localVersion}" +
            " to " +
            "${status.storeVersion}",
        dismissAction: () {
          SystemNavigator.pop();
        },
        updateButtonText: "Lets update",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.looks_two_rounded),
              label: Text("Players"),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.1),
                  disabledForegroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.4)),
              onPressed: () {
                Navigator.pushNamed(context, '/playerChoice2');
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.looks_3_rounded),
              label: Text("Players"),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.1),
                  disabledForegroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.4)),
              onPressed: () {
                Navigator.pushNamed(context, '/playerChoice3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
