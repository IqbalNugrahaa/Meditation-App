import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WheelPicker extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onSelectedItemChanged;

  const WheelPicker({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelectedItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: selectedIndex,
        ),
        itemExtent: 44,
        onSelectedItemChanged: onSelectedItemChanged,
        children: items
            .map((e) => Center(
                child: Text(e,
                    style: const TextStyle(fontSize: 20, color: Colors.black))))
            .toList(),
      ),
    );
  }
}
