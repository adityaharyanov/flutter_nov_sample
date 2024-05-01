import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  final Function(int) onDestinationSelected;
  final List<NavigationDestination> destinations;

  BottomTabBar({
    required this.destinations, 
    required this.onDestinationSelected, 
    super.key
  });

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (selectedIndex) {
              setState(() {
                this.selectedIndex = selectedIndex;
              });
            widget.onDestinationSelected(selectedIndex);
        } ,
        destinations: widget.destinations);
  }
}