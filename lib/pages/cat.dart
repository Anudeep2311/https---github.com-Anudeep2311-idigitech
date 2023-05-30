import 'package:comp_demo/grid_view_list.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  int _currentInd = 0;
  PageController _pageController = PageController();

  List<Categoris> catList = Categoris.categoryList;

  @override
  void dispose() {
    // TODO: implement dispose

    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: <Widget>[IconButton(icon: const Icon(Icons.arrow_back),

        //onPressed: (){},)],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
        ),
        backgroundColor: Colors.green.shade700,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 05,

        title: const Text(
          'Categories',
          style: TextStyle(fontSize: 15),
        ),
      ),

      // HEAD COUNTER NUMBERS//
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StepperComponent(
                        currentIndex: _currentInd,
                        indexo: 1,
                        onTap: () {
                          setState(() {
                            catList[0].isSelected = !catList[0].isSelected;
                            _currentInd = 1;
                          });
                        },
                        data: catList[0],
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: SizedBox(
                          width: 80,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      StepperComponent(
                        currentIndex: _currentInd,
                        indexo: 2,
                        onTap: () {
                          setState(() {
                            catList[1].isSelected = !catList[1].isSelected; 
                            _currentInd = 2;
                          });
                        },
                        data: catList[1],
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: SizedBox(
                          width: 80,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      StepperComponent(
                        currentIndex: _currentInd,
                        indexo: 3,
                        onTap: () {
                          setState(() {
                            catList[2].isSelected = !catList[2].isSelected;
                            _currentInd = 3;
                          });
                        },
                        data: catList[2],
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: SizedBox(
                          width: 80,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      StepperComponent(
                        currentIndex: _currentInd,
                        indexo: 4,
                        onTap: () {
                          setState(() {
                            catList[3].isSelected = !catList[3].isSelected;
                            _currentInd = 4;
                          });
                        },
                        data: catList[3],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Select Category',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Select Fabric',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Select Garment',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Customization',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return Center(
                        //**************child:Text('Page Counter ${index}')************
                        );
                  }
                  )
                  )
                  ),
                  SizedBox(
                      height: 20,
                  ),
                  GridViewItemsList(),
        ],
      ),


    




      //BOTTOM NAVIGATION BAR CODE STARTS HERE//
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green.shade700,
        backgroundColor: Colors.white10,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          print(index);
        },
        height: 70,
        items: const [
          // Icon(Icons.home_outlined, color: Colors.white, size: 30),
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.category_outlined, color: Colors.white, size: 30),
            label: 'Categories',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.money, color: Colors.white, size: 30),
            label: 'Reffer ',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite_border_outlined,
                color: Colors.white, size: 30),
            label: 'Wishlist',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.wallet, color: Colors.white, size: 30),
            label: 'Wallet',
            labelStyle: TextStyle(color: Colors.white),
          ),

          //Text('Home'),
        ],
      ),
      
    );
    
  }
  
}




class StepperComponent extends StatelessWidget {
  //for current num in the circle
  int indexo;
  int currentIndex;

  Categoris data;

  VoidCallback onTap;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.indexo,
    required this.onTap,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: data.isSelected ? Colors.greenAccent : Colors.white,
                    border: Border.all(color: Colors.green.shade500)),
                child: Text(
                  indexo.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        // Text(
        //   title,
        //   style: TextStyle(fontSize: 10),
        // ),
      ],
    );

    // return Expanded(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         children: [
    //           GestureDetector(
    //             onTap: onTap,
    //             child: Container(
    //               width:70,
    //               height: 30,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(100),
    //                   color: indexo == currentIndex
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   border: Border.all(color: Colors.lightGreenAccent)),
    //             ),
    //           ),
    //           Expanded(
    //               child: Container(
    //             height: 2,
    //             color: currentIndex == indexo + 1
    //                 ? Colors.greenAccent
    //                 : Colors.white,
    //           ))
    //         ],
    //       ),
    //       Text(
    //         title,
    //         style: TextStyle(fontSize: 13),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class Categoris {
  final String type;
  bool isSelected;

  Categoris(this.type, {this.isSelected = false});

  static List<Categoris> categoryList = [
    Categoris("Select Category", isSelected: false),
    Categoris("Select Fabric", isSelected: false),
    Categoris("Select Garment", isSelected: false),
    Categoris("Customization", isSelected: false),
  ];
}
