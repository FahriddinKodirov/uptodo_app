import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:uptodo_app/homework/figma/glavniy.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   bool isTrue = false;
  int _currentValue = 1;
  String sord = 'am';
  int count = 0;
  List list = [
    'AM',
    'PM'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(MyImages.ic_menu),
        ),
        backgroundColor: Colors.black,
        title: Text("HomePage"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: (() {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, 
                             builder: ((context) {
                               return sheet(context);
                             }));
        }),
        child: Container(
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.purple,
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          iconSize: 28,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.50),
          backgroundColor: Color(0xFF363636),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Index',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined),
              label: 'Focus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget sheet(context){
    return Container(
        height: MediaQuery.of(context).size.height*0.7,
         width: MediaQuery.of(context).size.width*1,
        color: MyColors.black,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                color: Color(0xFF363636),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
              ),
              child: Column(children: [
                SizedBox(height: 26,),
                 Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 25),
              child: Text('Add Task', style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height*0.064,
                width: MediaQuery.of(context).size.width*0.90,
                
                child: TextField(
                  cursorHeight: 28,
                  
                  enableIMEPersonalizedLearning:false,
                  strutStyle:StrutStyle(fontSize: 22),
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                    borderRadius:const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white54)),
                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    
            
                    hintText: 'Do math homework',
                    hintStyle: TextStyle(color: Colors.white70),
                    
            
                  )
          ),),
         
            SizedBox(height: 4,),
            Container(
                padding: EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height*0.064,
                width: MediaQuery.of(context).size.width*0.90,
                
                child:
                TextFormField(
                  
                  cursorHeight: 28,
                  strutStyle:StrutStyle(fontSize: 22),
                  enableIMEPersonalizedLearning:false,
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                    borderRadius:const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white54)),

                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.white54),
                    hintText: 'Do chapter 2 to 5 for next week',
                    hintStyle: TextStyle(color: Colors.white70,
                    ),
                    
                          
                  )
                        ),),
                        SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                      clock(),  
                      flag(context),
                      vuesax(),
                      
                      ],),
                      telegram(),
                    ],
                  )

              ]),
            ),
          ],
        ),
      );
  }

  Widget flag(context){
    return  InkWell(
                          onTap: () {
                            showDialog(
                             context: context, 
                              builder: (((context) => AlertDialog(
                                contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
                                content:Container(
                                height: MediaQuery.of(context).size.height*0.38,
                                width: MediaQuery.of(context).size.height*0.9,
                                color: Color(0xFF363636),
                                child: Column(
                                  children: [
                                    Divider(thickness: 0.7,color: Colors.white70,),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.28,
                                      width: MediaQuery.of(context).size.height*0.9,
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                                        itemCount: 10,
                                        itemBuilder: ((context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                            width: 60,
                                            height: 60,
                                            color: Color(0xFF272727),
                                            child: Column(children: [
                                              SizedBox(height: 4,),
                                              Container(
                                                child: SvgPicture.asset(MyImages.flag, width: 20,),),
                                              SizedBox(height: 3,),
                                              Container(child: Text(index.toString(),style: TextStyle(fontSize: 16, color: 
                                              Colors.white),),)
                                            ],)
                                        ),
                                          );
                                        }),
                                         
                                      ),
                                    ),
                                    // SizedBox(height: 32,),
                                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                          ),
                        InkWell(
                         onTap: (){
                          setState(() {
                                      //  Navigator.push(context, MaterialPageRoute(builder: (_)=> StartScreen()));

                          });
                          
                         }, child: Container(
                           height: 50,
                           width: 120,
                          color: MyColors.purple,
                          child: Container(
                         
                            child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))))
                        ],
                      ),
                                  ],
                                ),),
                                backgroundColor: Color(0xFF363636),
                                titlePadding: EdgeInsets.only(left: 85,top: 15),
                                title: Text('Task Priority',style: TextStyle(color: Colors.white),),
                                      ))));
      
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25),
                            child: SvgPicture.asset(MyImages.flag),
                          ),
                        );
                        
                      
  }

  Widget clock(){
  return InkWell(
                          onTap: () {
                            showDialog(
                             context: context, 
                              builder: (((context) => AlertDialog(
                                contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
                                content:Container(
                                height: MediaQuery.of(context).size.height*0.25,
                                width: MediaQuery.of(context).size.height*0.9,
                                color: Color(0xFF363636),
                                child: Column(
                                  children: [
                                    Divider(thickness: 0.7,color: Colors.white70,),
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(children: [
                                        
                                        Container(
                                          width: 60,
                                          color: Color(0xFF272727),
                                          child: NumberPicker(
                                           value: _currentValue,
                                           itemHeight: 25,
                                           itemWidth: 60,
                                           
                                           selectedTextStyle:TextStyle(color: Colors.white,fontSize: 25,
                                           fontWeight: FontWeight.w800,),
                                           textStyle: TextStyle(color: Colors.white12,fontSize: 20),
                                           minValue: 0,
                                           maxValue: count == 0?12:24,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() => _currentValue = value),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        Container(child: Text(':',style: TextStyle(fontSize: 30, color: 
                                        Colors.white),),),
                                        SizedBox(width: 16,),
                                        Container(
                                          width: 60,
                                          color: Color(0xFF272727),
                                          child: NumberPicker(
                                          infiniteLoop: false,
                                           value: _currentValue,
                                           itemHeight: 25,
                                           itemWidth: 60,
                                           
                                           selectedTextStyle:TextStyle(color: Colors.white,fontSize: 25,
                                           fontWeight: FontWeight.w800,),
                                           textStyle: TextStyle(color: Colors.white12,fontSize: 20),
                                           minValue: 0,
                                           maxValue: 60,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() => _currentValue = value),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 22,horizontal: 12),
                                          width: 65,
                                          height: 75,
                                          color: Color(0xFF272727),
                                          child: ListView.separated(
                                            itemCount: 2,
                                            itemBuilder: (BuildContext context, int count){
                                              
                                              return Container(
                                                
                                                child: Text(list[count], style: TextStyle(fontSize: 25,color: Colors.white),),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 0.2,);
                                            },
                                            ),
                                            
                                        ),
                                        
                                        
                                      ],),
                                    ),
                                    SizedBox(height: 28,),
                                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                          ),
                        InkWell(
                         onTap: (){
                          setState(() {
                                      //  Navigator.push(context, MaterialPageRoute(builder: (_)=> StartScreen()));

                          });
                          
                         }, child: Container(
                           height: 50,
                           width: 120,
                          color: MyColors.purple,
                          child: Container(
                         
                            child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))))
                        ],
                      ),
                                  ],
                                ),),
                                backgroundColor: Color(0xFF363636),
                                titlePadding: EdgeInsets.only(left: 85,top: 15),
                                title: Text('Choose time',style: TextStyle(color: Colors.white),),
                                      ))));
      
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25),
                            child: SvgPicture.asset(MyImages.clock),
                          ),
                        );

                        
 }

  Widget vuesax(){
  return 
          InkWell(
                  onTap: () {
                            
                    },
           child: Container(
                padding: EdgeInsets.only(left: 25),
                child: SvgPicture.asset(MyImages.vuesax),
                          ));
 }

  Widget telegram(){
    return InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Glavniy()));
                    },
           child: Container(
                padding: EdgeInsets.only(right: 20),
                child: SvgPicture.asset(MyImages.telegram),
                          ));
  }
}