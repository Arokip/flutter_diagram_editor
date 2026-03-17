/// Type-safe codec for encoding/decoding custom data to/from JSON maps.
class JsonCodec<T> {
  /// Creates a [JsonCodec] with the given [encode] and [decode] functions.
  const JsonCodec({required this.encode, required this.decode});

  /// Encodes a [T] value to a JSON-compatible map.
  final Map<String, dynamic> Function(T value) encode;

  /// Decodes a JSON map to a [T] value.
  final T Function(Map<String, dynamic> json) decode;
}
