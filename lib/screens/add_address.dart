import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/payment.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your address'),
        backgroundColor: Colors.teal,
      ),
      body: PaymentForm(), // We'll add this in a bit
    );
  }
}

class PaymentForm extends StatefulWidget {
  PaymentForm({Key key}) : super(key: key);
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  String expiryMonth;
  String expiryYear, names, dates;
  Address _paymentAddress = new Address();
  final List yearsList = List.generate(12, (int index) => index + 2020);
  Map<String, bool> touched = {
    "cardNumberField": false,
  };
  TextEditingController name, date, month, year, pcode, address;

  bool rememberInfo = false;
  UserDetails _cardDetails = new UserDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          TextFormField(
            controller: name,
            validator: (value) {
              if (value.isEmpty) return "This form value must be filled";
              return null;
            },
            // onSaved: (val) {
            //   name.text = val;
            //   _cardDetails.Name = val;
            // },
            decoration: InputDecoration(
              labelText: 'Name of user',
              icon: Icon(Icons.account_circle),
            ),
          ), // we will work in here
          TextFormField(
            controller: date,
            validator: (value) {
              if (value.isEmpty) return "This form value must be filled";
              return null;
            },
            onSaved: (val) {
              names = val;
              if (val == Null) {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    child: Text("Please enter "),
                  ),
                );
                name.text = val;
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Date of birth',
              icon: Icon(Icons.calendar_month_rounded),
            ),
          ),
          // TextFormField(
          //   validator: (value) {
          //     if (value.isEmpty) return "This form value must be filled";
          //     return null;
          //   },
          //   onSaved: (val) => _cardDetails.securityCode = int.parse(val),
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     labelText: 'Security Code',
          //     icon: Icon(Icons.lock_outline),
          //   ),
          //   maxLength: 4,
          // ),
          DropdownButtonFormField<String>(
            //      onSaved: (val) => _cardDetails.Month = val,
            value: expiryMonth,
            items: [
              'Jan',
              'Feb',
              'Mar',
              'Apr',
              'May',
              'Jun',
              'Jul',
              'Aug',
              'Sep',
              'Oct',
              'Nov',
              'Dec'
            ].map<DropdownMenuItem<String>>(
              (String val) {
                return DropdownMenuItem(
                  child: Text(val),
                  value: val,
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(() {
                expiryMonth = val;
              });
            },
            decoration: InputDecoration(
              labelText: 'Month',
              icon: Icon(Icons.calendar_today),
            ),
          ),
          DropdownButtonFormField(
            //   onSaved: (val) => _cardDetails.Year = val.toString(),
            value: expiryYear,
            items: yearsList.map<DropdownMenuItem>(
              (val) {
                return DropdownMenuItem(
                  child: Text(val.toString()),
                  value: val.toString(),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(() {
                expiryYear = val.toString();
              });
            },
            decoration: InputDecoration(
              labelText: 'Year',
              icon: Icon(Icons.calendar_today),
            ),
          ),
          TextFormField(
            //     onSaved: (val) => _paymentAddress.postCode = val,
            decoration: InputDecoration(
                labelText: 'Post Code', icon: Icon(Icons.location_on)),
          ),
          TextFormField(
            // onSaved: (val) => _paymentAddress.addressLine = val,
            decoration: InputDecoration(
                labelText: 'Address Line', icon: Icon(Icons.location_city)),
          ),
          CheckboxListTile(
            value: rememberInfo,
            onChanged: (val) {
              setState(() {
                rememberInfo = val;
              });
            },
            title: Text('Remember Information'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1 + 25),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                // UserDetails user = UserDetails(
                //     Name: _cardDetails.Name,
                //     Date: _cardDetails.Date,
                //     Year: _cardDetails.Year,
                //     Month: _cardDetails.Month);
                print(name);
                print(date.text);
                // FirebaseFirestore.instance.collection('people').add({
                //   'Name': name.text ?? "User name",
                //   'Date': date.text,
                //   'Year': expiryYear,
                //   'Month': expiryMonth,
                // });
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "Procead to payment",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
