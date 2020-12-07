class CustomComponentData {
  String title;
  String description;

  CustomComponentData({
    this.title,
    this.description,
  });

  CustomComponentData duplicate() {
    return CustomComponentData(
      title: this.title,
      description: this.description,
    );
  }
}
