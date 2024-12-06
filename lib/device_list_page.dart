import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:flutter/material.dart';

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({super.key});

  @override
  State<DeviceListPage> createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  final DeviceMarketingNames _deviceNames = DeviceMarketingNames();
  final List<String> _deviceModels = [
    'SM-A536E',
    'SM-N770F',
    'SM-N970F',
    'CPH1909',
    'Infinix X6850B',
    '2306EPN60G',
    'SM-A125F',
    '2201116SC',
    'KB2003',
    'Redmi Note 8',
    'SM-N975F',
    'FNE-NX9',
    '22011119TI',
    'SM-A315G',
    '24069RA21C',
    'CPH2481',
    'CPH2059',
    'SM-A346E',
    'SM-G985F',
    '2209129SC',
    'SM-A546E',
    'M2103K19C',
    '23090RA98C',
    '2201117TG',
    'VOG-L29',
    'M2101K7BG',
    'TECNO LH8n',
    'SM-A225F',
    'M2010J19SC',
    'V2029',
    '21091116C',
    'Redmi Note 8 Pro',
    'SM-N960F',
    'M2004J19C',
    '22101316UCP',
    'SM-A135F',
    'RMX3741',
    'SM-A515F',
    'itel S681LN',
    'vivo 1902',
    '22041219I',
    '23129RAA4G',
    'Infinix X6833B',
    'VOG-TL00',
    'vivo 1920',
    'V2130',
    'Redmi K30',
    'SM-S908E',
    '2109119BC',
    'vivo 1807',
    'SM-A155F',
    '2312DRA50C',
    'MI 5X',
    'M2003J15SC',
    'M2006C3LG',
    'SM-A307GN',
    'OPPO A83',
    'PESM10',
    'M2007J17C',
    '23076RN8DY',
    'TECNO BD2p',
  ];

  List<Map<String, String>> _deviceDetails = [];

  @override
  void initState() {
    super.initState();
    _getDeviceMarketingNames();
  }

  void _getDeviceMarketingNames() {
    final details = _deviceModels.map((model) {
      final marketingName = _deviceNames.getSingleNameFromModel(DeviceType.android, model);
      return {'model': model, 'name': marketingName};
    }).toList();
    setState(() {
      _deviceDetails = details;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Device List'),
      ),
      body: ListView.builder(
        itemCount: _deviceDetails.length,
        itemBuilder: (context, index) {
          final device = _deviceDetails[index];
          return ListTile(
            title: Text(device['model']!),
            subtitle: Text(device['name']!),
            leading: const Icon(Icons.smartphone),
          );
        },
      ),
    );
  }
}