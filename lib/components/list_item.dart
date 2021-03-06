import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListItem extends StatelessWidget {

  final item;
  final key;
  final index;
  final parentListID;
  final listType;
  final count;
  final onTap;
  final onInfoTap;

  ListItem({this.item, this.key, this.index, this.listType, this.count, this.onTap, this.onInfoTap, this.parentListID});

  buildDateString(date) {
    if (date != null) {
      return DateFormat.yMd().format(date.toDate());
    } else {
      return 'unknown date';
    }
  }

  buildCrossedOffDate(date) {
    var difference = new DateTime.now().difference(date.toDate());
    var howLongAgo = DateTime.now().subtract(difference);

    return (timeago.format(howLongAgo).toString());
  }

  buildTitleString() {
    if (listType == 'item') {
      return item.name + (item.quantity > 1 ? ' (' + item.quantity.toString() + ')' : '');
    } else { // crossed off, shopping list, store
      return item.name;
    }
  }

  buildSubtitleString() {
    if (listType == 'shopping list') {
      return this.count.toString() + ' item' + (this.count == 1 ? '' : 's');
    } else if (listType == 'store') {
      return item.address;
    } else if (listType == 'item') {
      // Added 12/31/20 by Name
      return 'Added ' + buildDateString(item.lastUpdated) + ' by ' + (item?.addedBy ?? 'no one');
    } else if (listType == 'crossedOff') {
      return '' + buildCrossedOffDate(item.lastUpdated) + ' at storeName';
    } else {
      return "cannot build subtitle";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      title: Text(buildTitleString(), style: (listType == 'crossedOff' ? TextStyle(decoration: TextDecoration.lineThrough) : TextStyle(decoration: TextDecoration.none))),
      subtitle: Text(buildSubtitleString()),
      leading: FlutterLogo(),
      trailing: IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: () => onInfoTap(item),
      ),
      onTap: () => onTap(item, index),
    );
  }
}