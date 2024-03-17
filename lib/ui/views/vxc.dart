// static import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// const double topViewHeight = 50.0;
//   static const double paginateDataTableHeaderRowHeight = 35.0;
//   static const double pagerWidgetHeight = 56;
//   static const double paginateDataTableRowHeight = kMinInteractiveDimension;

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hello'),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraint) {
//           return Column(
//             children: <Widget>[
//               Container(
//                 width: constraint.maxWidth,
//                 height: topViewHeight,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     TextButton(onPressed: () {}, child: Text('TEst 1')),
//                     TextButton(onPressed: () {}, child: Text('TEst 1'))
//                   ],
//                 ),
//               ),
//               Container(
//                   color: Colors.greenAccent,
//                   height: constraint.maxHeight - topViewHeight,
//                   child: Center(
//                     child: PaginatedDataTable(
//                         showCheckboxColumn: false,
//                         headingRowHeight: paginateDataTableHeaderRowHeight,
//                         rowsPerPage: ((constraint.maxHeight -
//                                     topViewHeight -
//                                     paginateDataTableHeaderRowHeight -
//                                     pagerWidgetHeight) ~/
//                                 paginateDataTableRowHeight)
//                             .toInt(),
//                         columns: const <DataColumn>[
//                           DataColumn(
//                             label: Text(
//                               'First Name',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ],
//                         //source: TableSource()),
//                   ))
//             ],
//           );
//         },
//       ),
//     );
//   }