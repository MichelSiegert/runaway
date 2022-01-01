import 'package:away/Pages/Menu/Widget/body/future_menu_body.dart';
import 'package:away/Widgets/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

import 'Widget/foot_future.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  double? myLoc;
  late bool inCelsius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Runaway"),
        backgroundColor: Colors.green,
      ),
      body: const SizedBox.expand(child:FutureMenuBody()),
      drawer: const Sidebar(),
      bottomNavigationBar: const BottomNavigationBarFuture(),
    );
  }

}

