import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'cat.dart';

class SBag extends StatefulWidget {
  const SBag({super.key});

  @override
  State<SBag> createState() => _SBagState();
}

class _SBagState extends State<SBag> {

  int _currentInd = 0;
  PageController _pageController = PageController();

  List<Categoris> catList = Categoris.categoryList;

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
                          
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          SizedBox(
            height: 10,
          ),
          Container(
            
            width: 40,
            height: 40,
            color: Colors.green.shade200,
            child: Padding(
              
              padding: EdgeInsets.only(left: 8.0, top: 12),
              child: Text("Bag Item : 3 " ),
              
            ),
            
          ),
          SizedBox(
            height: 10,
          ),
          
          Container(
            
              margin: EdgeInsets.only(left: 2, right:200 ),
            

             
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
        /*        TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Pincode",
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                        color: Colors.green.shade200
                    ),
                ),
             ),
             ),*/
             Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                 // TextField(
                   // cursorWidth: 5,
                    //decoration: InputDecoration(
                    
                   // hintText: 'Enter Pincode',
                    //border: OutlineInputBorder(borderSide: BorderSide.none)
                  //)),
              
                TextButton(onPressed: (){}, child: Text("Verify")),
              ],
             )
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
                  
        ],

      ),

    

 );
 
  }
}