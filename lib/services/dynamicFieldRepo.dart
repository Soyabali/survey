class DynamicField {

  final int Survey_Code;
  final String Field_Caption;
  final String Field_DataType;
  final String Field_Control;
  final int field_Length;
  final int iMandatory;

  DynamicField({
    required this.Survey_Code,
    required this.Field_Caption,
    required this.Field_DataType,
    required this.Field_Control,
    required this.field_Length,
    required this.iMandatory,
  });

  factory DynamicField.fromJson(Map<String, dynamic> json) {
    return DynamicField(
      Survey_Code: json['Survey_Code'],
      Field_Caption: json['Field_Caption'],
      Field_DataType: json['Field_DataType'],
      Field_Control: json['Field_Control'],
      field_Length: json['field_Length'],
      iMandatory: json['iMandatory'],
    );
  }
}
