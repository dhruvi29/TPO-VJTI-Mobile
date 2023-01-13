class Student{
  String? name, program, branch,email,instituteEmail,registrationId,phone,resumeLink, picLink;
  DateTime? birthdate;
  List<double>? grades = [];
  double? tenth, twelth;
  double? cpi;
  String? tenthBoard, twelthBoard;

  Student({this.name,this.program, this.branch,this.email,this.instituteEmail,this.registrationId,this.phone,this.resumeLink,this.tenth, this.twelth,this.tenthBoard, this.twelthBoard, this.picLink,this.cpi,this.grades}){
    birthdate = DateTime.now();
  }

}

Student student1 = Student(name: "Dhruvi Doshi",program: "B.Tech.",branch:"Computer Eng.",email: "drdoshi29@gmail.com",instituteEmail:"drdoshi_b19@ce.vjti.ac.in",registrationId: "191071080",phone:"9969618266",resumeLink: "https",tenth: 97,twelth: 89,tenthBoard: "ICSE",twelthBoard: "HSC", picLink: "assets/dhruvi.png",grades: [8.9,9,7.7,7.7,8.6,9.3],cpi: 8.6);

const dummyGrades = [0,0,0,0,0,0];