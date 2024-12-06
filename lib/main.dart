import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:device_name_viewer/device_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Name Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Device Name Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final deviceNames = DeviceMarketingNames();
  late AndroidDeviceInfo _androidInfo;
  late IosDeviceInfo _iosInfo;

  String deviceName = 'Unknown';
  String singleDeviceNameFromModel = '';

  void getDeviceName() async {
    if (Platform.isAndroid) {
      _androidInfo = await _deviceInfoPlugin.androidInfo;
      deviceName = deviceNames.getSingleNameFromModel(DeviceType.android, _androidInfo.model);
    } else if (Platform.isIOS) {
      _iosInfo = await _deviceInfoPlugin.iosInfo;
      deviceName = deviceNames.getSingleNameFromModel(DeviceType.ios, _iosInfo.utsname.machine);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your device name is:',
            ),
            Text(
              deviceName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DeviceListPage(),
          ),
        ),
        tooltip: 'Get Device Name',
        child: const Icon(Icons.perm_device_info),
      ),
    );
  }
}
