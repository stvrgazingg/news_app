import 'package:flutter/material.dart';
import '../../../../core/helper/is_connected.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() async {
    super.initState();
    final connected = await CheckConnectivity.isConnected();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
