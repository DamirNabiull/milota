import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milota/api/firebase_api.dart';

class AddChild extends StatefulWidget {

  const AddChild({Key? key}) : super(key: key);

  @override
  _AddChildState createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _photoDateController = TextEditingController();
  TextEditingController _publicationDateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');

  bool hasImage = false;
  String? _name = '', _parent = '', _phone = '', _link = '', _urlImage = '';
  DateTime? _photoDate = DateTime.now(), _publicationDate = DateTime.now();

  File? _image;
  final picker = ImagePicker();
  UploadTask? task;

  getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        hasImage = true;
      } else {
        print('No image selected.');
        hasImage = false;
      }
    });
  }

  checkData() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Сохранение информации'),
          content: const Text("Вы уверены, что все введенные данные коректны? \n\nПосле нажатия кнопки \"Да\" дождитесь закрытия окна, для полной загрузки данных в базу."),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  uploadImageToFirebaseStorage();
                },
                child: const Text("Да")
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Отмена"),
            ),
          ],
        );
      },
    );
  }

  uploadImageToFirebaseStorage() async {
    if (_image == null) return;

    final filename = '$_name$_parent$_phone';
    final destination = 'files/$filename';

    task = FirebaseApi.uploadFile(destination, _image!);

    if (task == null) return;
    final snapshot = await task!.whenComplete(() => null);
    _urlImage = await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('Children').add({
      'name' : _name,
      'parent' : _parent,
      'phone' : _phone,
      'link' : _link,
      'photoDate' : _photoDate,
      'publicationDate' : _publicationDate,
      'urlImage' : _urlImage,
    });

    Navigator.pushReplacementNamed(context, '/');
  }

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

  void _submit() async {
    if (_formKey.currentState!.validate() && _image != null) {
      _formKey.currentState!.save();
      print('$_name, $_parent, $_phone, $_link');
      checkData();
    } else {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Выход без сохранения'),
            content: const Text("Вы уверены, что хотите выйти не сохраняя данную информацию?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text("Да")
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Отмена"),
              ),
            ],
          );
        },
      );
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
                      child: GestureDetector(
                        child: Image(
                          image: FileImage(_image!),
                          height: 150,
                          width: 150,
                        ),
                        onTap: () {
                          getImage();
                        },
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
                            getImage();
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