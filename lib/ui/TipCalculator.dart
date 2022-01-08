
import 'package:first_flutter_app/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;
  int _personCounter = 1;
  int _tipPercentage = 0;

  Color _purple = HexColor("800080");
  Color _blueViolet = HexColor("8A2BE2");
  Color _darkViolet = HexColor("9400D3");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),

        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Per Person",
                    style: TextStyle(
                      color: _blueViolet,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$ ${
                    calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)
                    }",
                    style: TextStyle(
                      color: _blueViolet,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),),
                  )
                ],
              ),

            ),
            Container(
             margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blueGrey.shade100
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: _blueViolet,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount: ",
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }
                      catch(expression){
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Row(
                        children: [
                          InkWell(
                            onTap:()
                            {
                              setState(() {
                                if(_personCounter>1)
                                  {
                                    _personCounter--;
                                  }
                                else{
                                  // do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text("-",
                                style: TextStyle(
                                  color: _blueViolet,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ),
                          ),
                          Text("$_personCounter",
                          style: TextStyle(
                            color: _blueViolet,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          InkWell(
                            onTap: ()
                            {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text("+",
                                style: TextStyle(
                                  color: _blueViolet,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Row(
                        children: [
                          Text("\$ ${
                          calculateTotalTip(_billAmount, _personCounter, _tipPercentage).toStringAsFixed(2)
                          }",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _blueViolet,
                          ),)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("$_tipPercentage%",
                      style: TextStyle(
                        color: _blueViolet,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _blueViolet,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(), onChanged: (double newValue)
                      {
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      }),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount, int personCounter, int tipPercentage)
  {
    var totalPerPerson = (calculateTotalTip(billAmount, personCounter, tipPercentage)+billAmount)/personCounter;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int personCounter, int tipPercentage)
  {
    double totalTip = 0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null)
      {
        // not go
      }
    else{
      totalTip = (billAmount * _tipPercentage)/100;
    }
    return totalTip;
  }
}

















// class TipCalculator extends StatefulWidget {
//   const TipCalculator({Key? key}) : super(key: key);
//
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }
//
// class _TipCalculatorState extends State<TipCalculator> {
//   double _billAmount = 0.0;
//   int _personCounter = 1;
//   int _tipPercentage = 0;
//
//   Color _purple = HexColor("800080");
//   Color _blueViolet = HexColor("8A2BE2");
//   Color _darkViolet = HexColor("9400D3");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tip Calculator"),
//         centerTitle: false,
//         backgroundColor: Colors.blueAccent.shade700,
//
//         actions: [
//           IconButton(onPressed: ()=> debugPrint("Email Pressed"), icon: Icon(Icons.email)),
//           IconButton(onPressed: ()=> debugPrint("Call Pressed"), icon: Icon(Icons.call)),
//         ],
//       ),
//       body: Container(
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
//         color: Colors.white,
//         alignment: Alignment.center,
//
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: _purple.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Total Per Person",
//                   style: TextStyle(
//                     color: _blueViolet,
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                   ),),
//                   Text("\$ ${
//                   calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)
//                   }",
//                   style: TextStyle(
//                     color: _blueViolet,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35,
//                   ),),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: Colors.blueGrey.shade100,
//                 )
//               ),
//               child: Column(
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.numberWithOptions(decimal: true),
//                     style: TextStyle(
//                       color: _blueViolet,
//                       fontSize: 15,
//                     ),
//                     decoration: InputDecoration(
//                       prefixText: "Bill Amount: "
//                     ),
//                     onChanged: (String value){
//                       try{
//                         _billAmount = double.parse(value);
//                       }
//                       catch(exception){
//                         _billAmount = 0.0;
//                       }
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Split",
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 if(_personCounter>1)
//                                   {
//                                     _personCounter--;
//                                   }
//                                 else{
//                                   // do nothing
//                                 }
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Center(
//                                 child: Text("-",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                           Text("$_personCounter",
//                           style: TextStyle(
//                             color: _blueViolet,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),),
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 _personCounter ++;
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Center(
//                                 child: Text("+",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Split",
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("\$ ${
//                             calculateTotalTip(_billAmount, _personCounter, _tipPercentage).toStringAsFixed(2)
//                             }",
//                             style: TextStyle(
//                               color: _blueViolet,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text("$_tipPercentage%",
//                       style: TextStyle(
//                         color: _blueViolet,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),),
//                       Slider(
//                           min: 0,
//                           max: 100,
//                           activeColor: _blueViolet,
//                           inactiveColor: Colors.grey,
//                           divisions: 20,
//                           value: _tipPercentage.toDouble(), onChanged: (double newValue)
//                       {
//                         setState(() {
//                           _tipPercentage = newValue.round();
//                         });
//                       }),
//                     ],
//                   )
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       ),
//
//     );
//   }
//   calculateTotalPerPerson(double billAmount, int personCounter, int tipPercentage)
//   {
//     var totalPerPerson = (calculateTotalTip(billAmount, personCounter, tipPercentage) + billAmount) / personCounter;
//     return totalPerPerson.toStringAsFixed(2);
//   }
//
//   calculateTotalTip(double billAmount, int personCounter, int tipPercentage)
//   {
//     var totalTip = 0.0;
//     if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null)
//       {
//         // not go
//       }
//     else {
//       totalTip = (billAmount * tipPercentage) / 100;
//     }
//     return totalTip;
//   }
// }





// class TipCalculator extends StatefulWidget {
//   const TipCalculator({Key? key}) : super(key: key);
//
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }
//
// class _TipCalculatorState extends State<TipCalculator> {
//   int _tipPercentage = 0;
//   int _personCounter = 1;
//   double _billAmount = 0.0;
//
//   Color _purple = HexColor("800080");
//   Color _blueViolet = HexColor("8A2BE2");
//   Color _darkViolet = HexColor("9400D3");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         alignment: Alignment.center,
//         color: Colors.white,
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
//
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: _purple.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Total Per Person",
//                   style: TextStyle(
//                     color: _blueViolet,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 15,
//                   ),),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("\$75.40",
//                     style: TextStyle(
//                       color: _blueViolet,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: Colors.blueGrey.shade700,
//                 )
//               ),
//               child: Column(
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.numberWithOptions(decimal: true),
//                     style: TextStyle(
//                       color: _blueViolet,
//                     ),
//                     decoration: InputDecoration(
//                       prefixText: "Bill Amount: ",
//                     ),
//                     onChanged: (String value){
//                       try{
//                         _billAmount = double.parse(value);
//                       }
//                       catch(exception){
//                         _billAmount = 0.0;
//                       }
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Split",
//                       style: TextStyle(
//                         color: Colors.grey.shade700,
//                       ),),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 if(_personCounter>1)
//                                   {
//                                     _personCounter--;
//                                   }
//                                 else{
//                                   // do nothing
//                                 }
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Center(
//                                 child: Text("-",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                           Text("$_personCounter",
//                           style: TextStyle(
//                             color: _blueViolet,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),),
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 _personCounter++;
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Center(
//                                 child: Text("+",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                         ],
//                       ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Tip",
//                         style: TextStyle(
//                           color: Colors.grey.shade700,
//                         ),),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("\$50",
//                             style: TextStyle(
//                               color: _blueViolet,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 Column(
//                   children: [
//                     Text("$_tipPercentage%",
//                     style: TextStyle(
//                       color: _blueViolet,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),),
//                     Slider(
//                         min: 0,
//                         max: 100,
//                         activeColor: _blueViolet,
//                         inactiveColor: Colors.grey,
//                         divisions: 10,
//                         value: _tipPercentage.toDouble(), onChanged: (double newValue)
//                     {
//                       setState(() {
//                         _tipPercentage = newValue.round();
//                       });
//                     }),
//                   ],
//                 )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






// class TipCalculator extends StatefulWidget {
//   const TipCalculator({Key? key}) : super(key: key);
//
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }
//
// class _TipCalculatorState extends State<TipCalculator> {
//   int _tipPercentage = 0;
//   int _personCounter =1;
//   double _billAmount =0.0;
//   Color _purple = HexColor("800080");
//   Color _darkViolet = HexColor("9400D3");
//   Color _blueViolet = HexColor("8A2BE2");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: _purple.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Total Per Person",
//                   style: TextStyle(
//                     color: _blueViolet.withOpacity(0.8),
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),),
//                   Text("\$150",
//                   style: TextStyle(
//                     color: _blueViolet,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                   ),),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: Colors.blueGrey,
//                 )
//               ),
//               child: Column(
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.numberWithOptions(decimal: true),
//                     style: TextStyle(
//                       color: _blueViolet,
//                     ),
//                     decoration: InputDecoration(
//                       prefixText: "Bill Amount: ",
//                     ),
//                     onChanged: (String value)
//                     {
//                       try{
//                         _billAmount = double.parse(value);
//                       }
//                       catch(exception){
//                         _billAmount =0.0;
//                       }
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Split",
//                       style: TextStyle(
//                         color: Colors.grey.shade700,
//                       ),),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 if(_personCounter>1)
//                                   {
//                                     _personCounter--;
//                                   }
//                                 else{
//                                   // do nothing
//                                 }
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.5),
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               child: Center(
//                                 child: Text("-",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),),
//                               ),
//                             ),
//                           ),
//                           Text("$_personCounter",
//                           style: TextStyle(
//                             color: _blueViolet,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//
//                           ),),
//
//                           InkWell(
//                             onTap: ()
//                             {
//                               setState(() {
//                                 _personCounter++;
//                               });
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: _purple.withOpacity(0.5),
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               child: Center(
//                                 child: Text("+",
//                                 style: TextStyle(
//                                   color: _blueViolet,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }








// class TipCalculator extends StatefulWidget {
//   const TipCalculator({Key? key}) : super(key: key);
//
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }
//
// class _TipCalculatorState extends State<TipCalculator> {
//   int _tipPercentage = 0;
//   int _personCounter = 1;
//   double _billAmount = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1),
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Colors.purpleAccent.shade100,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Total Per Person"),
//                   Text("\$150"),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: Colors.blueGrey.shade100
//                 )
//               ),
//               child: Column(
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.numberWithOptions(decimal: true),
//                     style: TextStyle(
//                       color: Colors.purple,
//                     ),
//                     decoration: InputDecoration(
//                       prefixText: "Bill Amount: ",
//                     ),
//                     onChanged: (String value)
//                     {
//                       try{
//                         _billAmount = double.parse(value);
//                       }
//                       catch(exception)
//                       {
//                         _billAmount = 0.0;
//                       }
//                     },
//                   )
//                 ],
//               ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// class TipCalculator extends StatefulWidget {
//   const TipCalculator({Key? key}) : super(key: key);
//
//   @override
//   _TipCalculatorState createState() => _TipCalculatorState();
// }
//
// class _TipCalculatorState extends State<TipCalculator> {
//   int _tipPercentage = 0;
//   int _personCounter = 1;
//   double _billAmount = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20),
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Colors.purpleAccent.shade100,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Total Per Person"),
//                   Text("\$150"),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
