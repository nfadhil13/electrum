abstract class FromJSONMapper<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class ToJSONMapper<T> {
  Map<String, dynamic> toJson(T object);
}

abstract class JSONMapper<T> implements FromJSONMapper<T>, ToJSONMapper<T> {}
