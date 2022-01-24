import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(this.selectedStudent);

  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {  //with'ten sonra yazılanın fonk.larını kullanabilirsin
  Student selectedStudent;
  var formKey = GlobalKey <FormState>();

  _StudentEditState(this.selectedStudent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci güncelle"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Form(key: formKey, child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitField(),
            ],
          )),
        )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: const InputDecoration(labelText: "Öğrenci adı", hintText: "Dilara"),
      validator: validateFirstName,
      onSaved: (String? value){
        selectedStudent.firstName=value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: const InputDecoration(labelText: "Öğrenci soyadı", hintText: "Benli"),
      validator: validateLastName,
      onSaved: (String? value){
        selectedStudent.lastName=value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: const InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String? value){
        selectedStudent.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitField() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);  //anasayfaya
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}