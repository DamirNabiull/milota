import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milota/models/childPhotoInfo.dart';

class ShowListOfChildren extends StatefulWidget {
  const ShowListOfChildren({Key? key}) : super(key: key);

  @override
  _ShowListOfChildrenState createState() => _ShowListOfChildrenState();
}

class _ShowListOfChildrenState extends State<ShowListOfChildren> {

  List<ChildInfo> listOfChildren = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ChildInfo child = ChildInfo('Дамир', 'Евгения', '8-905-020-82-25', 'no link', null, null, null);
    listOfChildren.add(child);
    listOfChildren.add(child);
    listOfChildren.add(child);
    listOfChildren.add(child);
    listOfChildren.add(child);
    listOfChildren.add(child);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(0, 255, 255, 255),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushReplacementNamed(context, '/');}, icon: Icon(Icons.menu, color: Color.fromARGB(255, 159, 107, 121), size: 30,),)
        ],
      ),
      body: ListView.builder(
          itemCount: listOfChildren.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //print('Was tapped + $index');
              },
              onDoubleTap: () {
                //print('Was taped double  + $index');
              },
              child: Container(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 30)),
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 28)),
                          Text('Ребенок: ${listOfChildren[index].name!}', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                          Padding(padding: EdgeInsets.only(top: 12)),
                          Text(listOfChildren[index].parent!, style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                          Padding(padding: EdgeInsets.only(top: 12)),
                          Text(listOfChildren[index].phone!, style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 40)),
                          Text('01.01.2021', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Text('11.11.2021', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromARGB(255, 176, 137, 147),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
              ),
            );
          }
      ),
    );
  }
}
