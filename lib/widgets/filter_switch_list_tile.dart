import 'package:flutter/material.dart';

class FilterSwitchListTile extends StatelessWidget {
  FilterSwitchListTile(
      {@required this.title,
      @required this.switchValue,
      @required this.onChanged,
      this.subtitle});
  final bool switchValue;
  final String title;
  final String subtitle;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SwitchListTile(
        value: switchValue,
        onChanged: onChanged,
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
