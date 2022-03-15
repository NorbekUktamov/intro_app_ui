import 'package:flutter/material.dart';
import 'package:intro_app_ui/pages/home_page.dart';
import 'package:intro_app_ui/utilis/strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final id="intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();

}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex=0;


  @override
  void initState() {
    _pageController=PageController(
        initialPage: 0
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Pages controller with makepages
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                currentIndex=page;
              });
            },
            children:<Widget> [
              makePage("assets/images/image_1.png",Strings.stepOneTitle,Strings.stepOneContent),
              makePage("assets/images/image_2.png",Strings.stepTwoTitle,Strings.stepTwoContent),
              makePage("assets/images/image_3.png",Strings.stepThreeTitle,Strings.stepThreeContent),
            ],
          ),

          // indicator animation
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),

        ],
      ),
      //#skip button
      bottomSheet: currentIndex == 2
          ? Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.white,
        child:  GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 20,left: 20),
            child: Text('Skip',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w400),),
          ),
        ),
      )
          : Text(''),
    );
  }

  //Make Pages with image text
  Widget makePage(image,title,content){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Text(title,style: TextStyle(color: Colors.red,fontSize:20),),
              SizedBox(height: 30,),
              Text(content,style: TextStyle(color: Colors.green,fontSize: 20),textAlign: TextAlign.center,),

            ],
          ),
        ],
      ),

    );
  }


//Widget animation indicator
  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators=[];
    for(int i=0;i<3;i++){
      if(currentIndex==i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
