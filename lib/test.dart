import 'package:flutter/material.dart';

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
            const ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            ExpansionTile(
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            const ExpansionTile(
              title: Text('ExpansionTile 3'),
              subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: Text('This is tile number 3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }

//     buildCollapsed1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildCollapsed2() {
//       return buildImg(Colors.lightGreenAccent, 150);
//     }

//     buildCollapsed3() {
//       return Container();
//     }

//     buildExpanded1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   Text(
//                     "3 Expandable widgets",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildExpanded2() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//               Expanded(child: buildImg(Colors.orange, 100)),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightBlue, 100)),
//               Expanded(child: buildImg(Colors.cyan, 100)),
//             ],
//           ),
//         ],
//       );
//     }

//     buildExpanded3() {
//       return const Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               loremIpsum,
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expandable(
//                 collapsed: buildCollapsed1(),
//                 expanded: buildExpanded1(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed2(),
//                 expanded: buildExpanded2(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed3(),
//                 expanded: buildExpanded3(),
//               ),
//               const Divider(
//                 height: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Builder(
//                     builder: (context) {
//                       var controller =
//                           ExpandableController.of(context, required: true)!;
//                       return TextButton(
//                         child: Text(
//                           controller.expanded ? "COLLAPSE" : "EXPAND",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button!
//                               .copyWith(color: Colors.deepPurple),
//                         ),
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// class Card3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildItem(String label) {
//       return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(label),
//       );
//     }

//     buildList() {
//       return Column(
//         children: <Widget>[
//           for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
//         ],
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: <Widget>[
//               ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToExpand: true,
//                   tapBodyToCollapse: true,
//                   hasIcon: false,
//                 ),
//                 header: Container(
//                   color: Colors.indigoAccent,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         ExpandableIcon(
//                           theme: const ExpandableThemeData(
//                             expandIcon: Icons.arrow_right,
//                             collapseIcon: Icons.arrow_drop_down,
//                             iconColor: Colors.white,
//                             iconSize: 28.0,
//                             iconRotationAngle: math.pi / 2,
//                             iconPadding: EdgeInsets.only(right: 5),
//                             hasIcon: false,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "Items",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText1!
//                                 .copyWith(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 collapsed: Container(),
//                 expanded: buildList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
