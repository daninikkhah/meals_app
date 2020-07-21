import 'package:flutter/material.dart';

class RecipeTile extends StatefulWidget {
  final String step;
  final int index;
  RecipeTile({@required this.index, @required this.step});
  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('#${widget.index + 1}'),
      ),
      title: Text(widget.step),
      trailing: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: isChecked,
          onChanged: (val) {
            setState(() {
              isChecked = !isChecked;
            });
          }),
    );
  }
}
