enum NetworkResponseErrorType {
  socket,
  exception,
  responseEmpty,
  didNotSucceed
}

enum CallBackParameterName { all }

extension CallbackParameterNameExtension on CallBackParameterName {
  dynamic getJson(json) {
    if (json == null) return null;
    switch (this) {
      case CallBackParameterName.all:
        return json;
    }
  }
}
