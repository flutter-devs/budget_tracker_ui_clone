import 'package:budget_tracker_ui_clone/screens/dasboard.dart';
import 'package:budget_tracker_ui_clone/screens/login_screen.dart';
import 'package:budget_tracker_ui_clone/utils/colors.dart';
import 'package:budget_tracker_ui_clone/utils/device_size.dart';
import 'package:budget_tracker_ui_clone/utils/strings.dart';
import 'package:flutter/material.dart';


class OnBoarding extends StatefulWidget {

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  PageController _pageController = new PageController(
      initialPage: 0,
      keepPage: true
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: DeviceSize.height(context),
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("boarding_2", Strings.retroCopy,Strings.retroText),
                    onBoardPage("boarding_1", Strings.synthPolaroid,Strings.lorem),
                    onBoardPage("boarding", Strings.keytarSweenet,Strings.lorem),

                  ],
                  onPageChanged: (value)=>{setCurrentPage(value)},
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
  AnimatedContainer getIndicator(int pageNo)
  {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == pageNo) ? primary : Colors.grey
      ),
    );
  }



  Column onBoardPage(String img, String name,String description)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: DeviceSize.height(context)*0.5,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/$img.png')
            )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => getIndicator(index)),
        ),
        SizedBox(height: 30,),
        Expanded(
          flex: 0,
          child: Container(
           height: DeviceSize.height(context)/3,
            width:  DeviceSize.width(context)*0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name, style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 15,),

                  Text(description, style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 35,),

                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      width: DeviceSize.height(context)/3,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      child: Center(
                        child: Text(Strings.getStarted, style: TextStyle(
                          fontSize: 16,color: Colors.white,
                        ),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  setCurrentPage(int value)
  {
    currentPage = value;
    setState(() {

    });
  }
  openLoginPage()
  {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        LoginScreen()), (Route<dynamic> route) => false);

  }
}
