import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milota/api/firebase_api.dart';
import 'package:milota/pages/seeChild.dart';

class ShowListOfChildren extends StatefulWidget {
  const ShowListOfChildren({Key? key}) : super(key: key);

  @override
  _ShowListOfChildrenState createState() => _ShowListOfChildrenState();
}

class _ShowListOfChildrenState extends State<ShowListOfChildren> {

  static String? day, month, year;

  String? dateToString(DateTime date) {
    year = date.toString().split(' ')[0].split('-')[0];
    month = date.toString().split(' ')[0].split('-')[1];
    day = date.toString().split(' ')[0].split('-')[2];
    return '$day.$month.$year';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Children').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text(' ');
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].get('name')),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SeeChild(snapshot.data!.docs[index].get('name'), snapshot.data!.docs[index].get('parent'), snapshot.data!.docs[index].get('phone'), snapshot.data!.docs[index].get('photoDate').toDate(), snapshot.data!.docs[index].get('publicationDate').toDate(), snapshot.data!.docs[index].get('link'), snapshot.data!.docs[index].get('urlImage'))));
                      //print('Was tapped + $index');
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
                                Text('Ребенок: ${snapshot.data!.docs[index].get('name')}', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(snapshot.data!.docs[index].get('parent'), style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Text(snapshot.data!.docs[index].get('phone'), style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
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
                                Text('${dateToString(snapshot.data!.docs[index].get('photoDate').toDate())}', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Text('${dateToString(snapshot.data!.docs[index].get('publicationDate').toDate())}', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 130, 68, 84)),),
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
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) {
                    FirebaseApi.deleteFile(snapshot.data!.docs[index].get('urlImage'));
                    FirebaseFirestore.instance.collection('Children').doc(snapshot.data!.docs[index].id).delete();
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Удаление элемента"),
                          content: const Text("Вы уверены, что хотите удалить данный элемент?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text("Удалить")
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Отмена"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }
          );
        },
      ),
    );
  }
}
