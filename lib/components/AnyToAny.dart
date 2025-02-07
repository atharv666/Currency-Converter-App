import 'package:currency_convertor/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class Anytoany extends StatefulWidget {
  final rates;
  final Map currencies;
  const Anytoany({super.key, required this.rates, required this.currencies});

  @override
  State<Anytoany> createState() => _AnytoanyState();
}

class _AnytoanyState extends State<Anytoany> {
  TextEditingController amountcontroller = TextEditingController();
  String dropdownvalue1 = 'AUD';
  String dropdownvalue2 = 'AUD';
  String answer = "Converted Currency will be shown here :)";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Convert TO Any Currency", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextFormField(
              key: ValueKey('amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Amount",
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownvalue1,
                    icon: Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue1 = value!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("To"),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownvalue2,
                    icon: Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue2 = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("Convert", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  final newanswer = "${amountcontroller.text} $dropdownvalue1 = ${convertANY(widget.rates, amountcontroller.text, dropdownvalue1, dropdownvalue2)} $dropdownvalue2";
                  setState(() {
                    answer = newanswer;
                  });
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(answer),
            ),
          ],
        ),
      ),
    );
  }
}