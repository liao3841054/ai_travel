class Category {
  int? id;
  String? name;
  int? categorySort;
  List<QuestionList>? questionList;

  Category({id, name, categorySort, questionList});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categorySort = json['categorySort'];
    if (json['questionList'] != null) {
      questionList = <QuestionList>[];
      json['questionList'].forEach((v) {
        questionList!.add(QuestionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['categorySort'] = categorySort;
    if (questionList != null) {
      data['questionList'] = questionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionList {
  int? id;
  String? title;
  String? answer;
  int? questionSort;
  int? categoryId;
  String? createTime;
  String? updateTime;

  QuestionList(
      {id, title, answer, questionSort, categoryId, createTime, updateTime});

  QuestionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    answer = json['answer'];
    questionSort = json['questionSort'];
    categoryId = json['categoryId'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['answer'] = answer;
    data['questionSort'] = questionSort;
    data['categoryId'] = categoryId;
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}
