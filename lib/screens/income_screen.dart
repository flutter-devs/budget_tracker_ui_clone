
import 'package:budget_tracker_ui_clone/model/day_month.dart';
import 'package:budget_tracker_ui_clone/model/income_model.dart';
import 'package:budget_tracker_ui_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  int activeDay = 0;
  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share("share data");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.of(context).pop();
        },),
        title: Text("Income",style: TextStyle( color:Colors.black,fontSize: 20,
          fontWeight: FontWeight.bold,),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(AntDesign.search1,color: Colors.black,),
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 25),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(months.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 40) / 6,
                            child: Column(
                              children: [
                                Text(
                                  months[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primary
                                          : black.withOpacity(0.02),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 7, bottom: 7),
                                    child: Text(
                                      months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeDay == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 20, left: 00, bottom: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(income.length, (index) {
                      return Container(
                              height: size.height*0.15,
                              width: size.width *0.7,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                color: blue,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(income[index]['name'],style: TextStyle(color: white.withOpacity(0.8),)),
                                      subtitle: Text(income[index]['price'],style: TextStyle(color: white,
                                          fontSize: 25,fontWeight: FontWeight.bold ),),
                                      trailing: Image.asset(income[index]['image'],),
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, left: 20,),
                                        child: Divider(
                                          thickness: 1,
                                          color: white.withOpacity(0.5) ,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }))
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Text("Transactions"),
                ],
              ),
            ),

            Column(
                children: List.generate(transaction.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: Icon(Icons.transform,size: 20,color: Colors.grey,),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                transaction[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              Text(
                                transaction[index]['price'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: (size.width*0.5),
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xff67727d).withOpacity(0.1)),
                                  ),
                                  Container(
                                    width: (size.width *0.5) *
                                        transaction[index]['percentage'],
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: transaction[index]['color']),
                                  ),
                                ],
                              ),
                              Text(
                                transaction[index]['label_percentage'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color:
                                    Color(0xff67727d).withOpacity(0.6)),
                              ),
                            ],
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20,),
                          child: Divider(
                            thickness: 0.8,
                          ),
                        )
                      ],
                    ),
                  );
                })),

            Padding(
              padding: EdgeInsets.only(
                  left: 20,right: 20,  top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height *0.15,
                    width: size.width*0.4,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        // changes position of shadow
                      ),
                    ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              child: Icon(Icons.file_copy,color: primary,),
                            ),
                            Text("Export",style: TextStyle(color: Colors.black,fontSize: 18,
                                fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:() => _onShareWithEmptyOrigin(context),
                    child: Container(
                      height: size.height *0.15,
                      width: size.width*0.4,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          // changes position of shadow
                        ),
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                child: Icon(Icons.share,color: primary,),
                              ),
                              Text("Share",style: TextStyle(color: Colors.black,fontSize: 18,
                                  fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ) ,
    );
  }
  

}
