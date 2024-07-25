class Applinks {
  // static var baseUrl = 'http://3.25.172.114';
  // static var loginForPassenger = '$baseUrl/api/driver/login';

  static var baseUrl = 'http://65.0.217.176';

  // <---------------------- Academy Urls--------------------------------------------------------------------------------------------------------------->

  static var signupForAcademy = '$baseUrl/admin/sigup';
  static var loginForAcademy = '$baseUrl/admin/login';
  static var signUpForStudent = '$baseUrl/admin/signup/student';
  static var signupforTeacher = '$baseUrl/admin/signup/teacher';
  static var fetchAllStudentForAcademy = '$baseUrl/admin/students';
  static var fetchAllTeachersForAcademy = '$baseUrl/admin/teachers';
  static var createSubjects = '$baseUrl/admin/subjects';
  static var listofsubjects = '$baseUrl/admin/subjects/';
  static getStudentBySubject(var subjectid) =>
      '$baseUrl/admin/subjects/$subjectid/students';
  // <---------------------- Teachers Urls--------------------------------------------------------------------------------------------------------------->
  static var loginForTeacher = '$baseUrl/teacher/login';
  static var mySubjectsForTeacher = '$baseUrl/teacher/subjects';
  static var createChapter = '$baseUrl/teacher/chapters';
  static var addNotes = '$baseUrl/teacher/notes';
  static var createTopics = '$baseUrl/teacher/topics';
  static chaptersForSubjectForTeacher(String subjectId) =>
      '$baseUrl/teacher/subjects/$subjectId/chapters';
  static topicsForChapterforTeacher(String topicId) =>
      '$baseUrl/teacher/chapters/$topicId/topics';
  static var createChapterWiseTest = '$baseUrl/teacher/tests';
  static notesForTeacher(String chapterid) =>
      '$baseUrl/teacher/chapters/$chapterid/notes';
  static fetchTestForTeacher(String chapterid) =>
      '$baseUrl/teacher/chapters/$chapterid/test';
  // <---------------------- Students Urls-------------------------------------------------------------------------------------------------------------->
  static var loginForStudent = '$baseUrl/student/login';
  static var mySubjectsForStudent = '$baseUrl/student/subjects';
  static chaptersForSubjectForStudent(String subjectId) =>
      '$baseUrl/student/subjects/$subjectId/chapters';
  static topicsForChapterforStudent(String topicId) =>
      '$baseUrl/student/chapters/$topicId/topics';
  static notesForStudent(String chapterid) =>
      '$baseUrl/student/chapters/$chapterid/notes';
  static fetchTestForStudent(String chapterid) =>
      '$baseUrl/student/chapters/$chapterid/test';
  static var attemptTest = '$baseUrl/student/attempt-test';
}
