class ResponseModel {
  String? responseId;
  String? responseText;
  List? responseChoices;
  String? responseAction;
  String? responseFilterType;
  String? responseFilterData;
  ResponseModel.fromJson(Map<String, dynamic> map) {
    responseId = map['responseId'];
    responseText = map['responseText'];
    responseChoices = map['responseChoices'];
    responseAction = map['responseAction'];
    responseFilterData = map['responseFilterData'];
    responseFilterType = map['responseFilterType'];
  }

  toJson() => {
        "responseId": responseId,
        "responseText": responseText,
        "responseChoices": responseChoices,
        "responseAction": responseAction,
        "responseFilterData": responseFilterData,
        "responseFilterType": responseFilterType
      };
}
