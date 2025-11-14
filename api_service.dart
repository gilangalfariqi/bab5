class ApiService {
  Dio dio = Dio();

  final String readKey = ""; // SESUAIKAN DENGAN READ API KEYS PADA AKUN MASING-MASING

  String field1Url =
      "https://api.thingspeak.com/channels/<CHANNEL ID>/fields/1/last.json?api_key=";
  String field2Url =
      "https://api.thingspeak.com/channels/<CHANNEL ID>/fields/2/last.json?api_key=";
  String field3Url =
      "https://api.thingspeak.com/channels/<CHANNEL ID>/fields/3/last.json?api_key=";

  // TEMPERATUR FIELD
  Future<Field1Model> getField1() async {
    try {
      final response = await dio.get("$field1Url$readKey");
      return Field1Model.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // HUMADITY FIELD
  Future<Field2Model> getField2() async {
    try {
      final response = await dio.get("$field2Url$readKey");
      return Field2Model.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // SOIL MOISTURE FIELD
  Future<Field3Model> getField3() async {
    try {
      final response = await dio.get("$field3Url$readKey");
      return Field3Model.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
