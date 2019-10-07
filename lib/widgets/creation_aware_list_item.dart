import 'package:flutter/material.dart';

class CreationAwareListItem extends StatefulWidget {
  
  final Function onCreated;
  final Widget child;

  const CreationAwareListItem({Key key, this.onCreated, this.child}) : super(key: key);
  
  
  @override
  _CreationAwareListItemState createState() => _CreationAwareListItemState();
}

class _CreationAwareListItemState extends State<CreationAwareListItem> {
  
  @override
  void initState() {
    super.initState();
    if(widget.onCreated != null) {
      widget.onCreated();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}