import 'package:coursse_flutter_ui_app/widgets/app_page.dart';
import 'package:coursse_flutter_ui_app/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Visibility(
                visible: _currentPage <2,
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutBack
                     );
                  },
                  child: Text('SKIP'),
                ),
              replacement:TextButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/login_screen');

              },child: Text('START'),) ,),
            ),
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: const [
                  AppPage(
                      image: 'image_1',
                      title: 'Welcome!',
                      content:
                          "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch."),
                  AppPage(
                      image: 'image_2',
                      title: 'Add to cart',
                      content:
                          "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch.."),
                  AppPage(
                      image: 'image_3',
                      title: 'Enjoy Purchase!',
                      content:
                          "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch."),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(
                  selected: _currentPage == 0,
                  marginEnd: 10,
                ),
                CustomIndicator(
                  selected: _currentPage == 1,
                  marginEnd: 10,
                ),
                CustomIndicator(selected: _currentPage == 2),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){
                  if(_currentPage>0){
                    _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOutBack);

                  }
                }, icon: Icon(Icons.arrow_back_ios_outlined),
                  color: _currentPage == 0? Colors.grey:Colors.black,
                ),
                IconButton(onPressed: (){
                  if(_currentPage<2){
                    _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOutBack);

                  }
                }, icon: Icon(Icons.arrow_forward_ios_outlined,),
                  color: _currentPage == 2? Colors.grey:Colors.black,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Visibility(
              visible: _currentPage ==2 ,
              maintainSize: true,
              maintainState: true ,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    child: Text('Start')),
              ),
            ),
            SizedBox(
              height: 50,
            ),





            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //         backgroundColor:_currentPage == 0 ? Colors.deepOrange : Colors.transparent,
            //         borderColor: Colors.cyan,
            //         size: 10
            //     ),
            //     TabPageSelectorIndicator(
            //         backgroundColor:_currentPage == 1 ? Colors.deepOrange : Colors.transparent,
            //         borderColor: Colors.cyan,
            //         size: 10
            //     ),
            //     TabPageSelectorIndicator(
            //         backgroundColor:_currentPage == 2 ? Colors.deepOrange : Colors.transparent,
            //         borderColor: Colors.cyan,
            //         size: 10
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
