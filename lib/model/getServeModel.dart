
class SurveySubmissionModel {
  final Map<String, dynamic> data;

  SurveySubmissionModel({required this.data});

  factory SurveySubmissionModel.fromJson(Map<String, dynamic> json) {
    return SurveySubmissionModel(data: json);
  }
}