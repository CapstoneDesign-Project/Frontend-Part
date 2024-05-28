class ParentInfo {
  String parentEmail;
  String parentName;
  String parentPhoneNumber;
  int parentKakaoId;
  List<ChildInfo> children;

  ParentInfo({
    required this.parentEmail,
    required this.parentName,
    required this.parentPhoneNumber,
    required this.parentKakaoId,
    required this.children,
  });

  Map<String, dynamic> toJson() => {
        "parentEmail": 'test@dd.com',
        "parentName": 'parentName',
        "parentPhoneNumber": 'parentPhoneNumber',
        "parentKakaoId": 10,
        "children": children.map((child) => child.toJson()).toList(),
      };
}

class ChildInfo {
  String childName;
  String childSchool;
  int childGrade;
  int childClass;
  int childNumber;

  ChildInfo({
    required this.childName,
    required this.childSchool,
    required this.childGrade,
    required this.childClass,
    required this.childNumber,
  });

  Map<String, dynamic> toJson() => {
        "childName": childName,
        "childSchool": childSchool,
        "childGrade": childGrade,
        "childClass": childClass,
        "childNumber": 1,
      };
}
