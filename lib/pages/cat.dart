import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  
  int _currentInd=0;
  PageController _pageController = PageController();

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
            bottomRight: Radius.circular(25)
          )
        ),
        backgroundColor: Colors.green.shade700,
        leading: IconButton(onPressed: (){},
        icon: const Icon(Icons.arrow_back),),
        titleSpacing: 05,
        
        title: const Text('Categories', style: TextStyle(
          fontSize: 15
        ),),

      ),

      // HEAD COUNTER NUMBERS//
     body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10,),
       
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              StepperComponent(
                currentIndex: _currentInd,
                indexo: 0, onTap: () { 
                  setState(() {
                    _currentInd=0;
                  });
                 },
              ),
              StepperComponent(
                currentIndex: _currentInd,
                indexo: 1, onTap: () { 
                  setState(() {
                    _currentInd = 1;
                  });
                 },
              ),
              StepperComponent(
                currentIndex: _currentInd,
                indexo: 2, onTap: () { 
                  setState(() {
                    _currentInd = 2;
                  });
                 },
              ),
              StepperComponent(
                currentIndex: _currentInd,
                indexo: 3, onTap: () { 
                  setState(() {
                    _currentInd = 3;
                  });
                 }, 
              ) 
            ],
          ),
        ),
        Expanded(child: PageView.builder(
          controller: _pageController,
          itemCount: 4 ,
          itemBuilder: 
        ((context, index) {
          return Center(
            //**************child:Text('Page Counter ${index}')************
          );
        })))
      ],
     ),
    

    //BOTTOM NAVIGATION BAR CODE STARTS HERE//
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green.shade700,
        backgroundColor: Colors.white10,
        animationDuration: Duration(microseconds: 400),
        onTap: (index){
          print(index);
        },
        items: [
        Icon(Icons.home_outlined,
        color: Colors.white,
        size: 30,),

        //Text('Home'),
        Icon(Icons.category_outlined,
        color: Colors.white,
        size: 30),
        Icon(Icons.money,
        color: Colors.white,
        size: 30),
        Icon(Icons.favorite_border_outlined,
        color: Colors.white,
        size: 30),
        Icon(Icons.wallet,
        color: Colors.white,
        size: 30)
      ],),
    );
  }
}

//THE HEAD NUMBER COUNT PROGRESS//

class StepperComponent extends StatelessWidget {
  //for current num in the circle
  int indexo;
  int currentIndex;

  VoidCallback onTap;
  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.indexo,
    required this.onTap
  }); 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [Row(
          
        children: [
          
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
               color: indexo == currentIndex? Colors.greenAccent:Colors.white,
                border:Border.all(color: Colors.lightGreenAccent)
              ),
            ),
          ),
          Expanded(child: Container(
            height: 2,
            color:currentIndex == indexo+1? Colors.greenAccent:Colors.white,
          ))
        ],
      ),
      Text('Select Category ', style: TextStyle(fontSize: 13),),
      
      


      ],
      ),   
      
    );
  }
}