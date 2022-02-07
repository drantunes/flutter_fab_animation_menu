import 'package:flutter/material.dart';
import 'package:flutter_fab_animation_menu/widgets/fab_menu_button.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB Animation'),
      ),
      floatingActionButton: const FabMenuButton(),
    );
  }
}
