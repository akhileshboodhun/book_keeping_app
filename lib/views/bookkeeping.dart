import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class BookKeepingForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _BookKeepingFormState();
  }
}

class _BookKeepingFormState extends State<BookKeepingForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ["Rupees", "Dollars", "Pound Sterling"];
  final _minimumpadding = 5.0;

  var _currentitemsel = "";

  void initState() {
    super.initState();
    _currentitemsel = _currencies[0];
  }

  TextEditingController principalcontroller = TextEditingController();
  TextEditingController roicontroller = TextEditingController();
  TextEditingController termcontroller = TextEditingController();

  var displayresult = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumpadding * 2),
            // margin: EdgeInsets.all(_minimumpadding * 2),
            child: ListView(
              children: <Widget>[
                Icon(LineAwesomeIcons.book, size: 100),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: principalcontroller,
                        validator: (String value) {
                          Pattern pat = r'^[0-9]';
                          RegExp regex = new RegExp(pat);

                          if (value.isEmpty) {
                            return "Principal required*";
                          } else if (!(regex.hasMatch(value))) {
                            return "Number have to be input";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Principal',
                            hintText: 'Enter Principal',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            errorBorder: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.yellow)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))))),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: roicontroller,
                        validator: (String value) {
                          Pattern pat = r'^[0-9]';
                          RegExp regex = new RegExp(pat);

                          if (value.isEmpty) {
                            return "Rate of Interest required*";
                          } else if (!(regex.hasMatch(value))) {
                            return "Number have to be input";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Rate of Interest',
                            hintText: 'In percent',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            errorBorder: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.yellow)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))))),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            Pattern pat = r'^[0-9]';
                            RegExp regex = new RegExp(pat);

                            if (value.isEmpty) {
                              return "Time required*";
                            } else if (!(regex.hasMatch(value))) {
                              return "Number have to be input";
                            }
                            // if(value.isEmpty){
                            //   return "Enter year properly";
                            // }
                          },
                          style: textStyle,
                          controller: termcontroller,
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,
                              ),
                              errorBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.yellow)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentitemsel,
                          style: textStyle,
                          onChanged: (String newvalsel) {
                            _ondropdownitemsel(newvalsel);
                          },
                        )),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  this.displayresult = _calculatetotal();
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Reset',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumpadding * 2),
                  child: Text(
                    this.displayresult,
                    style: textStyle,
                  ),
                )
              ],
            ),
          )),
    );
  }

  // Widget getImage() {
  //   AssetImage assetimage = AssetImage('images/money.png');
  //   Image image = Image(
  //     image: assetimage,
  //     width: 125.0,
  //     height: 125.0,
  //   );

  //   return Container(
  //     child: image,
  //     margin: EdgeInsets.all(_minimumpadding * 10),
  //   );
  // }

  void _ondropdownitemsel(String newvalsel) {
    setState(() {
      this._currentitemsel = newvalsel;
    });
  }

  String _calculatetotal() {
    double principal = double.parse(principalcontroller.text),
        roi = double.parse(roicontroller.text),
        term = double.parse(termcontroller.text);
    double total = principal + (principal * roi * term) / 100;
    String result =
        'After $term years, your investment will be worth $total $_currentitemsel';
    return result;
  }

  void _reset() {
    principalcontroller.text = "";
    roicontroller.text = "";
    termcontroller.text = "";
    displayresult = "";
    _currentitemsel = _currencies[0];
  }
}
