import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddChild extends StatefulWidget {

  const AddChild({Key? key}) : super(key: key);

  @override
  _AddChildState createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _photoDateController = TextEditingController();
  TextEditingController _publicationDateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  bool hasImage = false;
  String? _name = '', _parent = '', _phone = '', _link = '';
  DateTime? _photoDate = DateTime.now(), _publicationDate = DateTime.now();

  _photoDatePicker() async {
    final DateTime? phDate = await showDatePicker(
        context: context,
        initialDate: _photoDate!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (phDate != null && phDate != _photoDate) {
      setState(() {
        _photoDate = phDate;
      });
      _photoDateController.text = _dateFormatter.format(phDate);
    }
  }

  _publicationDatePicker() async {
    final DateTime? puDate = await showDatePicker(
        context: context,
        initialDate: _publicationDate!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (puDate != null && puDate != _publicationDate) {
      setState(() {
        _publicationDate = puDate;
      });
      _publicationDateController.text = _dateFormatter.format(puDate);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _photoDateController.dispose();
    _publicationDateController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_name, $_parent, $_phone, $_link');
      Navigator.pushReplacementNamed(context, '/');
    }
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
            _submit();
            }, icon: Icon(Icons.menu, color: Color.fromARGB(255, 159, 107, 121), size: 30,),)
        ],
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
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
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите имя ребенка!'
                                  : null,
                              onSaved: (input) => _name = input,
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
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите имя родителя!'
                                  : null,
                              onSaved: (input) => _parent = input,
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
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите номер телефона!'
                                  : null,
                              onSaved: (input) => _phone = input,
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
                              onTap: _photoDatePicker,
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
                              onTap: _publicationDatePicker,
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
                              validator: (input) => input!.trim().isEmpty
                                  ? 'Введите ссылку на фотографии!'
                                  : null,
                              onSaved: (input) => _link = input,
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
                    hasImage
                        ? Container(
                      child: Image(
                        image: AssetImage('images/logo.png'),
                        height: 150,
                        width: 150,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 176, 137, 147),
                          width: 3,
                        ),
                        color: Colors.white,
                      ),
                    )
                        : Container(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              hasImage = !hasImage;
                            });
                          },
                          icon: Icon(Icons.add),
                          iconSize: 130,
                          color: Color.fromARGB(255, 176, 137, 147),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 176, 137, 147),
                          width: 3,
                        ),
                        color: Colors.white,
                      ),
                    )
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
