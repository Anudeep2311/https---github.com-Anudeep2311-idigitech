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
  TextEditingController controller = TextEditingController();

  List<Categoris> catList = Categoris.categoryList;

  List<ItemData> itemList = ItemData.itemList;

  bool? isChecked =false;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // stepper widget-----
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 20, top: 6),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: SizedBox(
                              width: 130,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: SizedBox(
                              width: 130,
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
                          // const Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          //   child: SizedBox(
                          //     width: 80,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
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
                    ),
                  ],
                ),
              ),

              //
              SizedBox(
                height: 10,
              ),

              // bag item widget-----
              Container(
                width: 40,
                height: 40,
                color: Colors.green.shade200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Bag Item : 3 ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Text(
                      "Total : \u{20B9} :4500 ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //
              // enter pincode widget---->
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 240,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Enter Pincode",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade600),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        minimumSize: const Size(100, 40)),
                    child: const Text(
                      "Verify",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              // Expanded(
              //     child: PageView.builder(
              //         controller: _pageController,
              //         itemCount: 3,
              //         itemBuilder: ((context, index) {
              //           return Center(
              //               //**************child:Text('Page Counter ${index}')************
              //               );
              //         }))),

              const SizedBox(height: 30),
              //
              // items listing widget--->
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  var data = itemList[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 130,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              data.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),

                        //item data column----
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.itemName,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              data.itemDesc,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 12),
                            // dropdown row

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20,
                                  // width: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  margin: EdgeInsets.only(right: 5),
                                  color: Colors.green.shade200,
                                  child: Row(
                                    children: [
                                      Text("Size : 5 "),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  // width: 80,
                                  margin: EdgeInsets.only(left: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  color: Colors.green.shade200,
                                  child: Row(
                                    children: [
                                      Text("Qty : 2 "),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            //price row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\u{20B9}${data.itemDiscPrice.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "\u{20B9}${data.itemPrice.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "${data.itemDiscount.toString()}% Off",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            Text(
                              "Delivery by: Enter Pincode",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                            ),
                          ],
                        ),

                        //icons column----

                        Spacer(),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                data.isLiked = !data.isLiked;
                                setState(() {});
                              },
                              child: Icon(
                                data.isLiked
                                    ? Icons.favorite_outlined
                                    : Icons.favorite_outline_outlined,
                                color: Colors.black,
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.favorite_outline_outlined,
                            //     color: Colors.black,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  );
                },
              ),

              //Offers And More Offers Starts----------->
              Container(
                margin: EdgeInsets.only(left: 10,right:10),
                
                padding: EdgeInsets.only(left: 5,top: 5, right: 10),
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade100),
             //   color: Colors.green.shade100,
                child: Column(
                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.offline_bolt,size: 18,),
                        Text("Available Offers",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.green,endIndent: 200),
                    SizedBox(height: 05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.circle , size: 12,),
                        Text("Lorem ipsum dolor sit amet,consectetur adipiscing elit"),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('More Offers' ,  style: TextStyle(decoration: TextDecoration.underline , fontWeight: FontWeight.w600 ) ,)
                      ],

                    ),
                  ],
                ),

              ),
              SizedBox(height: 20),

              Container(

                   margin: EdgeInsets.only(left: 10,right:10),
                    padding: EdgeInsets.only(right: 210,left: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade100),
                    height: 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        Icon(Icons.discount_outlined, size: 20,),
                        Text("Apply Coupon", style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),),
                 /*       SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Enter Coupon",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green.shade600),
                        ),
                      ),
                    ),
                  ), */                       
                      ],
                    ),
              ),

              SizedBox(height: 20),

              Container(
                  margin: EdgeInsets.only(right:10,left: 10),
                    padding: EdgeInsets.only(right: 100,left: 20 ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade100),
                    height: 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.currency_rupee_sharp,size: 20,),

                        Text("Apply Reward"),
                        Text("(100 Coins)" , style: TextStyle(color: Colors.green.shade700),),
                        Checkbox(value: isChecked,
                        activeColor: Colors.black,
                         onChanged: (newbool){
                          setState(() {
                            isChecked =newbool;
                          });
                         },)
                      ],

                    ),
              ),
              SizedBox(height: 30,),

              Container(
                 margin: EdgeInsets.only(right:10,left: 10),
                 padding: EdgeInsets.only(left: 10  , top: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade50),
                    height: 130,

                    child: Column(
                      children: [
                        
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Payment Summary", style: TextStyle(fontWeight: FontWeight.w600),),      
                          ],


                        ),
                         Divider(
                              thickness: 1,
                              color: Colors.green,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text("Total MRP"),
                                Text("\u20B9 5000")
                              ],
                            ),
                            SizedBox(height: 5),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text("Discount"),
                                Text("\u20B9 500")
                              ],
                            ),
                             SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text("Coupon Discount"),
                                Text("Apply Coupon")
                              ],
                            ),
                             SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //  crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                              
                                Text("Shipping Charges"),
                                Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"),
                                Text("\u20B9 100",style: TextStyle(decoration: TextDecoration.lineThrough),),
                                Text("\t\tFREE",style: TextStyle(fontWeight: FontWeight.w600),)
                              ],
                            ),
                      ],
                    ),
                    

              ),

              SizedBox(
                height: 20,
              ),
              Container(
                 margin: EdgeInsets.only(right:10,left: 10),
                 padding: EdgeInsets.only(left: 10  ,  right: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade100),
                    height: 50,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                              Text("Total Amount",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),),
                              Text("\u20b9 4500",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),)
                      ],
                    ),
              ),
              

              SizedBox(
                height: 15,
              ),

              Divider(color: Colors.green.shade100,thickness: 1, height: 5,),

              SizedBox(height: 15,),
              Container(
                //margin: EdgeInsets.only(right:10,left: 10),
                 //padding: EdgeInsets.only(left: 10  ,  right: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green.shade100),
                    height: 50,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        
                        ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 135,vertical: 18),
                      
                        backgroundColor: Colors.green.shade700,),
                    child: const Text(
                      "Add Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                      ],
                    ),
              ),
              SizedBox(height: 15,),


              // SizedBox(
              //   height: 700,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemData {
  final String itemName;
  final String itemDesc;
  final int itemDiscPrice;
  final int itemPrice;
  final int itemDiscount;
  final String imagePath;
  bool isLiked;

  ItemData({
    required this.itemName,
    required this.itemDesc,
    required this.itemDiscPrice,
    required this.itemPrice,
    required this.itemDiscount,
    required this.imagePath,
    this.isLiked = false,
  });

  static List<ItemData> itemList = [
    ItemData(
      itemName: "Greenfab",
      itemDesc: "Anarkali kurta with dupatta set ",
      itemDiscPrice: 1500,
      itemPrice: 2000,
      itemDiscount: 25,
      imagePath: "assets/dupatta.jpg",
      isLiked: false,
    ),
    ItemData(
      itemName: "Greenfab",
      itemDesc: "Anarkali kurta with dupatta set ",
      itemDiscPrice: 1500,
      itemPrice: 2000,
      itemDiscount: 25,
      imagePath: "assets/dupatta.jpg",
      isLiked: false,
    ),
    ItemData(
      itemName: "Greenfab",
      itemDesc: "Anarkali kurta with dupatta set ",
      itemDiscPrice: 1500,
      itemPrice: 2000,
      itemDiscount: 25,
      imagePath: "assets/dupatta.jpg",
      isLiked: false,
    ),
  ];
}
