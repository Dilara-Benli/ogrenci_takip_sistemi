class StudentValidationMixin{

  String? validateFirstName(String? value){
    if(value==null){
      return "Bir değer giriniz";
    }
    if(value.length< 2) {
      return "İsim en az iki karakter olmalıdır";
    }
  }

  String? validateLastName(String? value){
    if(value==null){
      return "Bir değer giriniz";
    }
    if(value.length< 2) {
      return "Soyad en az iki karakter olmalıdır";
    }
  }

  String? validateGrade(String? value) {
    var grade = int.parse(value!);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır";
    }
  }
}