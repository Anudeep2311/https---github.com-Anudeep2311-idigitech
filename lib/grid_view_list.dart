import 'package:flutter/material.dart';

class GridViewItemsList extends StatelessWidget {
  List<String> ImageList = [
    "assets/kurta.jpg",
    "assets/saree.jpg",
    "assets/dupatta.jpg",
    "assets/saree1.jpg"
  ];

  List<String> ProductTitles =[
    "Kurta",
    "Saree",
    "Dupatta",
    "Maharashtrian Saree"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      
      child: GridView.builder(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.6,
      crossAxisSpacing: 30,
      crossAxisCount: 2,), itemBuilder: ((context, index) {
        return Container(
         // color: Colors.green.shade400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green.shade100,
                  height: 220,
                  
                  child: SizedBox(
                    height: 200,
                    
                    child: Stack(
                    
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ClipRRect(
                              
                              
                              borderRadius:BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                            
                              child: Image.asset(ImageList[index]), ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 30,
                  color: Colors.green.shade50,
                  child: Center(
                    child: Text(ProductTitles[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      
                    ),
                    ),
                  ),
                ),
                
                
              ],
            ),
        );
        
      })),
    );
  }
}