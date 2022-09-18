import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/src/blocs/animals_bloc.dart';
import 'package:testing_task/src/ui/home/home_page.dart';
import 'package:testing_task/src/ui/login/login_page.dart';
import 'package:testing_task/src/ui/signup/signup_page.dart';
import 'package:testing_task/themes/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages.add(LoginScreen());
    _pages.add(HomeScreen());
    _pages.add(SignupScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Theme.of(context).backgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: AppColors.white,
          shape: CircularNotchedRectangle(),
          elevation: 5.5,
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight * 1.2,
            decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarColor,
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                elevation: 5.5,
                selectedItemColor: Theme.of(context).selectedRowColor,
                unselectedItemColor: Theme.of(context).unselectedWidgetColor,
                showUnselectedLabels: true,
                onTap: (index) {
                  bloc.dispose();
                  setState(() {
                    _currentIndex = index;

                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                            'assets/login.png'),
                      ),
                      label: 'Sign In'),
                  BottomNavigationBarItem(
                      icon: SizedBox(width: 10.w), label: ''),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          'assets/signup.png')),
                      label: 'Sign Up'),

                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex=1;
            });
          },
          child: Container(
              height: 52.sp,
              width: 52.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [AppColors.colorED1C62, AppColors.primary])),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: ImageIcon(AssetImage('assets/home.png'),color: Theme.of(context).bottomAppBarColor,),
              )
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
