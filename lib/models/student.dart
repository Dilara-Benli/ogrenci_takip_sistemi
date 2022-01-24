class Student{
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;
  String image="https://www.eurocircuits.com/wp-content/uploads/Student-icon.jpg";

  Student(this.firstName,this.lastName,this.grade);
  Student.withId(this.id,this.firstName,this.lastName,this.grade);
  Student.withOutInfo();

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }

/* void set setFirstName(String value){
    this.firstName=value;
    }
  */
}