import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'cat.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  
  int _currentInd = 0;
  PageController _pageController = PageController();

  List<Categories> catList = Categories.categoryList;

  void dispose() {
    // TODO: implement dispose

    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        titleSpacing: 0.1,

        title: const Text(
          'Shopping Bag',
          style: TextStyle(fontSize: 18),
        ),
      ),

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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                      ),
                    ],
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'Bag',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Address',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Payment',
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
                  itemCount: 3,
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
        ],
      ),

    );
  }
}


class StepperComponent extends StatelessWidget {
  //for current num in the circle
  int indexo;
  int currentIndex;

  Categories data;

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
      ],
    );

 
   
  }
}

/*class HeadText extends StatelessWidget{
  String BItem = 'Bag Items:3';
  String Total = 'Total: ₹ 4500';

  HeadText({
super.key,
required this.BItem,
required this.Total,

  });*/

class Categories {
  final String type;
  bool isSelected;

  Categories(this.type, {this.isSelected = false});

  static List<Categories> categoryList = [
    Categories("Bag", isSelected: false),
    Categories("Address", isSelected: false),
    Categories("Payment", isSelected: false),
  ];
}
