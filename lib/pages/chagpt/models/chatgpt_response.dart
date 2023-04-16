class ChatGPTResponse {
  List<Choices>? choices;
  String? error;
  bool requesting = false;
  bool isAnimateEnd = false;
  String? question;
  String? roleName;

  ChatGPTResponse({this.choices, this.error});

  ChatGPTResponse.fromJson(Map<String, dynamic> json) {
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    error = json['error'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    data['question'] = question;
    data['roleName'] = roleName;
    return data;
  }
}

class Choices {
  String? text;
  int? index;
  String? finishReason;
  bool? block;
  Map<String, dynamic>? message;

  Choices({this.text, this.index, this.finishReason, this.block});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    text = text?.trim();
    index = json['index'];
    finishReason = json['finish_reason'];
    block = json['block'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['index'] = index;
    data['finish_reason'] = finishReason;
    data['block'] = block;
    data['message'] = message;
    return data;
  }
}
