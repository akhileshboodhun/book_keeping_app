import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/utils/dateformatter.dart';
import 'package:book_keeping_app/widgets/single_cashbook.dart';
import 'package:flutter/material.dart';

class MyPaginatedDT extends StatefulWidget {
  MyPaginatedDT({Key key, this.title, this.mylist, this.context})
      : super(key: key);
  BuildContext context;
  final String title;
  List<Cashbook> mylist;

  @override
  _MyPaginatedDTState createState() =>
      _MyPaginatedDTState(this.mylist, this.context);
}

class _MyPaginatedDTState extends State<MyPaginatedDT> {
  CashbooksTableDataSource _tableDataSource;
  BuildContext context;
  List<dynamic> mylist;
  List<dynamic> templist;
  _MyPaginatedDTState(this.templist, this.context);
  int _defaultRowsPerPage;
  int _rowsPerPage;
  int emp_count;
  //Future<List<Cashbook>> fdt = fetchCashbooks();

  @override
  void initState() {
    super.initState();

    setState(() {
      mylist = templist;
      emp_count = mylist.length;
    });
  }

  void _pagechange(int value) {
    setState(() {});
    setState(() {
      print((value + _defaultRowsPerPage).toString());
      print('current index:' + value.toString());
      print('diff:' + (mylist.length - value).toString());
      _rowsPerPage = ((mylist.length - value) < _defaultRowsPerPage)
          ? (mylist.length - value)
          : _defaultRowsPerPage;
      print('curr rows' + _rowsPerPage.toString());
    });
    setState(() {});
  }

  @override
  Widget build(context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    int screen_rows = (screen_height ~/ 74.18);
    print(screen_rows);
    _tableDataSource = CashbooksTableDataSource(this.mylist, context: context);
    // var todoCount = this.mylist.length;
    _defaultRowsPerPage =
        (mylist.length < screen_rows) ? mylist.length : screen_rows;
    _rowsPerPage = _defaultRowsPerPage;
    return Theme(
        data: ThemeData(highlightColor: Colors.transparent),
        child: Builder(
            builder: (BuildContext context) => Container(
                child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        width: MediaQuery.of(context).size.width),
                    child: PaginatedDataTable(
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(label: Text('Receipt No.')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Date')),
                      ],
                      sortColumnIndex: 1,
                      columnSpacing: 0.5,
                      sortAscending: false,
                      source: _tableDataSource,
                      rowsPerPage: _rowsPerPage,
                      onPageChanged: _pagechange,
                      header: SizedBox.shrink(),
                    )))));
  }
}

class CashbooksTableDataSource extends DataTableSource {
  final List<Cashbook> _emplist;
  int _rowsSelectedCount = 0;
  BuildContext context;

  CashbooksTableDataSource(this._emplist, {this.context});

  void taptap(Cashbook cb) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => SingleCashbookPage(cb: cb)));
  }

  @override
  DataRow getRow(int index) {
    //assert(index >= 0);
    //if (index >= _todolist.length) return null;
    final Cashbook element = _emplist[index];
    return DataRow.byIndex(
      // onSelectChanged: (bool isSelected) {
      //
      // },

      index: index,
      cells: <DataCell>[
        DataCell(Text(element.receipt_no.toString()),
            onTap: () => taptap(element)),
        DataCell(Text(element.quantity.toString()),
            onTap: () => taptap(element)),
        DataCell(Text(element.amount.toString()), onTap: () => taptap(element)),
        DataCell(
            Text(
                '${element.date.day}-${element.date.month}-${element.date.year}'),
            onTap: () => taptap(element)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _emplist == null ? 0 : _emplist.length;

  @override
  int get selectedRowCount => _rowsSelectedCount;

  void sort<T extends Object>(
      Comparable<T> getField(Cashbook d), bool isAscending) {
    _emplist.sort((a, b) {
      if (isAscending) {
        final Cashbook c = a;
        a = b;
        b = c;
      }

      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  void selectAll(bool isAllChecked) {
    notifyListeners();
  }
}
