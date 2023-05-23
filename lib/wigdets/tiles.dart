import 'package:flutter/material.dart';

Widget customListTile(BuildContext context, String label, ) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, "/$label"),
    child: ListTile(
      title: Text(label),
      trailing: const Icon(Icons.navigate_next_outlined),
    ),
  );
}

class CustomExpansionTile extends StatefulWidget {
  String label;
  bool isExpanded;
  List<String> item;

  CustomExpansionTile(
      {Key? key, required this.label, required this.isExpanded, required this.item})
      : super(key: key);

  @override
  State<CustomExpansionTile> createState() =>
      _CustomExpansionTileState(label: label, isExpanded: isExpanded, item: item);
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  String label;
  bool isExpanded;
  List<String> item;

  _CustomExpansionTileState(
      {required this.label, required this.isExpanded, required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(label),
        trailing: Icon(
            isExpanded ? Icons.arrow_drop_down_outlined : Icons.arrow_right_outlined),
        onExpansionChanged: (bool expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return customListTile(context, item[index]);
              }, childCount: item.length))
            ],
          )
        ]);
  }
}
