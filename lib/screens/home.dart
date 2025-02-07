import 'package:currency_convertor/components/AnyToAny.dart';
import 'package:currency_convertor/components/UsdToAny.dart';
import 'package:currency_convertor/functions/fetchrates.dart';
import 'package:currency_convertor/models/rates.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map>allcurriences;
  late Future<RatesModel>result;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   result = fetchrates();
    //   allcurriences = fetchcurriences();
    // });
    result = fetchrates();
    allcurriences = fetchcurriences();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Curreny Convertor", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/currency.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                return Center(
                  child: FutureBuilder<Map>(
                    future: allcurriences,
                    builder: (context, currsnapshot) {
                      if(currsnapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return Column(
                        children: [
                          SizedBox(height: 20,),
                          Usdtoany(
                            curriencies: currsnapshot.data!,
                            rates: snapshot.data!.rates,
                          ),
                          SizedBox(height: 20,),
                          Anytoany(
                            currencies: currsnapshot.data!,
                            rates: snapshot.data!.rates,
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}