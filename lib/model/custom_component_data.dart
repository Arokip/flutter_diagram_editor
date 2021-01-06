class CustomComponentData {
  String someText;
  String description;

  CustomComponentData({
    this.someText,
    this.description,
  });

  CustomComponentData duplicate() {
    return CustomComponentData(
      someText: this.someText,
      description: this.description,
    );
  }
}
