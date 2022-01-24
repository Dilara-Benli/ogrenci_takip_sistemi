import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students=[];

  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {  //with'ten sonra yazılanın fonk.larını kullanabilirsin
  List<Student> students=[];
  var student = Student.withOutInfo();
  var formKey = GlobalKey <FormState>();

  _StudentAddState(this.students);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
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
      decoration: const InputDecoration(labelText: "Öğrenci adı", hintText: "Dilara"),
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName=value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Öğrenci soyadı", hintText: "Benli"),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastName=value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String? value){
        student.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitField() {
    return ElevatedButton(
        child: Text("Kaydet"),
        onPressed: (){
          if(formKey.currentState!.validate()){
            formKey.currentState!.save();
            students.add(student);
            saveStudent();
            Navigator.pop(context);  //anasayfaya
          }
        },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
