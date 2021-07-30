import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeeChild extends StatefulWidget {
  String nameOutside, parentOutside, phoneOutside, linkOutside, urlImageOutside;
  DateTime photoDateOutside, publicationDateOutside;
  SeeChild(this.nameOutside, this.parentOutside, this.phoneOutside, this.photoDateOutside, this.publicationDateOutside, this.linkOutside, this.urlImageOutside);

  @override
  _SeeChildState createState() => _SeeChildState();
}

class _SeeChildState extends State<SeeChild> {

  TextEditingController _photoDateController = TextEditingController();
  TextEditingController _publicationDateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _photoDateController.text = _dateFormatter.format(widget.photoDateOutside);
    _publicationDateController.text = _dateFormatter.format(widget.publicationDateOutside);
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
            Navigator.pop(context);
          }, icon: Icon(Icons.menu, color: Color.fromARGB(255, 159, 107, 121), size: 30,),)
        ],
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Имя ребенка:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              initialValue: widget.nameOutside,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 9)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Родитель:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              initialValue: widget.parentOutside,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 9)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Номер телефона:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              initialValue: widget.phoneOutside,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 9)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Дата съемки:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              controller: _photoDateController,
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите дату съемки!'
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 9)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Дата релиза:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              controller: _publicationDateController,
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите дату релиза!'
                                  : null,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 9)),
                    Container(
                      height: 83,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ссылка:', style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 110, 41, 59),
                          ),),
                          Padding(padding: EdgeInsets.only(top: 9)),
                          SizedBox(
                            height: 50,
                            width: 270,
                            child: TextFormField(
                              readOnly: true,
                              initialValue: widget.linkOutside,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5),
                                filled: true,
                                fillColor: Color.fromARGB(255, 176, 137, 147),

                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0, color: Color.fromARGB(255, 176, 137, 147)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              cursorColor: Colors.white,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 33)),
                    Container(
                      child: GestureDetector(
                        child: Image(
                          image: NetworkImage(widget.urlImageOutside),
                          height: 150,
                          width: 150,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 176, 137, 147),
                          width: 3,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}