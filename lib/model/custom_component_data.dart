abstract class CustomComponentData {
  const CustomComponentData();

  CustomComponentData.fromJson(Map<String, dynamic> json);

  CustomComponentData duplicate();

  Map<String, dynamic> toJson();
}

class EmptyCustomComponentData extends CustomComponentData {
  const EmptyCustomComponentData() : super();

  EmptyCustomComponentData.fromJson(Map<String, dynamic> json);

  @override
  CustomComponentData duplicate() {
    return EmptyCustomComponentData();
  }

  @override
  Map<String, dynamic> toJson() => {};
}

/// This shows how to extends custom data.
class ExampleCustomComponentData extends CustomComponentData {
  final String exampleString;
  final List<int> exampleList;

  ExampleCustomComponentData({
    this.exampleString = 'this is an example string',
    this.exampleList = const [],
  }) : super();

  ExampleCustomComponentData.fromJson(Map<String, dynamic> json)
      : exampleString = json['exampleString'],
        exampleList = List<int>.from(json['exampleList']);

  @override
  Map<String, dynamic> toJson() => {
        'exampleString': exampleString,
        'exampleList': exampleList,
      };

  @override
  CustomComponentData duplicate() {
    return ExampleCustomComponentData(
      exampleString: this.exampleString,
      exampleList: List<int>.from(this.exampleList),
    );
  }
}
