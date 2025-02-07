import 'package:currency_convertor/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class Usdtoany extends StatefulWidget {
  final Map curriencies;
  final rates;
  const Usdtoany({super.key, required this.curriencies, @required this.rates});

  @override
  State<Usdtoany> createState() => _UsdtoanyState();
}

class _UsdtoanyState extends State<Usdtoany> {
  TextEditingController usdcontroller = TextEditingController();
  String dropdownvalue = "AUD";
  String answer = "Converted Currency will be shown here :) ";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("USD TO Any Currency", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            SizedBox(height: 20,),
            TextFormField(
              controller: usdcontroller,
              decoration: InputDecoration(
                hintText: "Enter USD",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newvalue){
                      setState(() {
                        dropdownvalue = newvalue!;
                      });
                    },
                    items: widget.curriencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },).toList(),
                  )
                ),
                SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: ElevatedButton(
                    child: Text("Convert", style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      final newanswer = "${usdcontroller.text} USD = ${convertUSD(widget.rates, usdcontroller.text, dropdownvalue)} $dropdownvalue";
                      setState(() {
                        // answer = usdcontroller.text + 'USD = ' + convertUSD(widget.rates, usdcontroller.text, dropdownvalue) + dropdownvalue;
                        answer = newanswer;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor)
                    ),
                  ),
                ),
                SizedBox(width: 20,)
              ],
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