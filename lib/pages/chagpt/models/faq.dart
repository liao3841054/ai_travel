class FAQModel {
  int? id;
  String? title;
  String? description;
  String? img;
  int? sort;
  String? createTime;

  FAQModel({id, title, description, img, sort, createTime});

  FAQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
    sort = json['sort'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['img'] = img;
    data['sort'] = sort;
    data['createTime'] = createTime;
    return data;
  }
}
