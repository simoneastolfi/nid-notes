import 'package:flutter/material.dart';
import 'package:nid_notes/models/user.dart';
import 'package:nid_notes/blocs/user_bloc.dart';

import '../models/note.dart';

class InsertScreen extends StatefulWidget {
  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {

  final _insertFormKey = GlobalKey<FormState>();

  String? _title;
  String? _content;
  String? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea nota'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _insertFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Titolo'
                    ),
                    onSaved: (value) {
                      _title = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci un titolo';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Contenuto'
                    ),
                    onSaved: (value) {
                      _content = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_insertFormKey.currentState!.validate()) {
                        _insertFormKey.currentState!.save();
                        Note note = Note(_title!, _content);
                        // userBloc.login(_user).then((success) {
                        //   if (success) {
                        //     Navigator.of(context).pushReplacementNamed('/home');
                        //   } else {
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(SnackBar(content: Text('Credenziali errate')));
                        //   }
                        // });
                      }
                    },
                    child: Text('Salva'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}