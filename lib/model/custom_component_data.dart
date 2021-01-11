/// Used to store any extra component data by extending this class and passing it to the ComponentData object.
/// Function duplicate have to be overridden. It should return a copy of CustomComponentData object.

abstract class CustomComponentData {
  const CustomComponentData();

  CustomComponentData duplicate();

  String serialize();

  CustomComponentData deserialize(String data);
}

class EmptyCustomComponentData extends CustomComponentData {
  const EmptyCustomComponentData();

  @override
  EmptyCustomComponentData duplicate() {
    return this;
  }

  @override
  String serialize() {
    return '{}';
  }

  @override
  EmptyCustomComponentData deserialize(String data) {
    return EmptyCustomComponentData();
  }
}
