enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
}

class ResponseCode {
  // API status code
  static const int SUCCESS = 200; // succes with data
  static const int NO_CONTENT = 201; // success without content
  static const int FORBIDDEN = 403; // failure, api reject the request
  static const int BAD_REQUEST = 400; // failure, api reject the request
  static const int UNAUTHORISED = 401; //failure, user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is incorrect and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int UNKNOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status code
  static const String SUCCESS = "Success"; // succes with data
  static const String NO_CONTENT =
      "Success without content"; // success without content
  static const String FORBIDDEN =
      "Forbidden request, try again later"; // failure, api reject the request
  static const String BAD_REQUEST =
      "Bad request, try again later"; // failure, api reject the request
  static const String UNAUTHORISED =
      "User is unauthorised, try again later"; //failure, user is not authorised
  static const String NOT_FOUND =
      "Url is not found, try again later"; // failure, api url is incorrect and not found
  static const String INTERNAL_SERVER_ERROR =
      "Some thing went wrong, try again later"; // failure, crash happened in server side

  // local status code
  static const String UNKNOWN = "Some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "Time out error, try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "Time out error, try again later";
  static const String SEND_TIMEOUT = "Time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
}
