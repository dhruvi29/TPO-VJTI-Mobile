import 'package:supa_test/models/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentService {
  final SupabaseClient supabase = Supabase.instance.client;
  Student _studentFromSupabaseState(data) {


    data = data[0];
    Student.student = data;
    return Student(
      id: data['id'],
      firstName: data['firstName'],
      middleName: data['middleName'],
      lastName: data['lastName'],
      mobileNumber: data['mobileNumber'],
      clgEmail:data['mobileNumber'],
      clgId:data['clgId'],
      programme:data['programme'],
      branch:data['branch'],
      dob:data['dob'],
      age:data['age'],
      gender:data['gender'],
      gradYear:data['gradYear'],
      SPI1:data['SPI1'],
      SPI2:data['SPI2'],
      SPI3:data['SPI3'],
      SPI4:data['SPI4'],
      SPI5:data['SPI5'],
      SPI6:data['SPI6'],
      SPI7:data['SPI7'],
      SPI8:data['SPI8'],
      CPI:data['CPI'],
      tenth:data['10th'],
      twelveth:data['12th'],
      isDreamPlaced:data['isDreamPlaced'] ,
      isNormalPlaced:data['isNormalPlaced'],
      isSuperPlaced:data['isSuperPlaced'],
      resumeLink:data['resumeLink'],
      personalEmail:data['personalEmail'],
      isVerified: data['isVerified']
    );
  }

  Stream<Student> get student{
    return supabase
        .from('Students')
        .stream(primaryKey: ['id'])
        .eq('id', "632b83c0-ac19-4057-afb9-b477c58f6f1e")
        .map(_studentFromSupabaseState);
  }

  Future<Student> initialData(id)async{
    return _studentFromSupabaseState(await supabase
        .from('Students')
        .select('''*''').match({'id': id}));
  }
}
