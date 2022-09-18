import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testing_task/src/blocs/animals_bloc.dart';
import 'package:testing_task/src/ui/home/widget/cat_cell.dart';
import 'package:testing_task/src/ui/widgets/product_cell.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';

import '../../models/item_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  List drawerItems=[
    {'image':'assets/displayMode.png','title': 'Display Mode','onTap':(){
      // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const OtherUserScreen()));
    }},
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    drawerItems=[
      {'image':'assets/displayMode.png','title': 'Display Mode','onTap':(){
        // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const OtherUserScreen()));
      }},

    ];
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220.h,
                color: AppColors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed:(){
                          _key.currentState!.closeDrawer();
                        }, icon: Icon(Icons.clear),color: AppColors.color9E9B9B,),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 100.sp,
                        height: 100.sp,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset('assets/profile.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Full Name',
                      style: textStyle(
                          20.sm, AppFontWeights.semiBold, AppColors.white),
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: drawerItems[index]['onTap'],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(drawerItems[index]['image'],width: 18.w,color: AppColors.color9E9B9B,),
                            SizedBox(width: 18.w,),
                            Text(
                              drawerItems[index]['title'],
                              style: textStyle(
                                  16.sm, AppFontWeights.normal, AppColors.color9E9B9B),
                            ),

                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 28.h);
                    },
                    itemCount: drawerItems.length),
              ),

              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 80.h),
                child: InkWell(
                  onTap: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/logout.png',width: 18.w,color: AppColors.colorED1C62,),
                      SizedBox(width: 18.w,),
                      Text(
                        'Logout',
                        style: textStyle(
                            16.sm, AppFontWeights.normal, AppColors.colorED1C62),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 51.h, bottom: 22.h,right: 16.w,left: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap:()=>_key.currentState!.openDrawer(),
                      child: Container(
                        width: 40.sp,
                        height: 40.sp,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/menu.png'),
                        ),
                      ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(
                        height: 21.h,
                      ),
                      StreamBuilder(
                        stream: bloc.allAnimals,
                        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: ListView.separated(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  primary: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      // onTap: ()=> navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const AdDetailsScreen())),
                                      child: ProductCell(snapshot: snapshot.data!.results[index],),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(height: 10.h);
                                  },
                                  itemCount: snapshot.data!.results.length),
                            );
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),


                      SizedBox(height: 100.h,),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
