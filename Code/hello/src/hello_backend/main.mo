import Blob "mo:base/Blob";
import Text "mo:base/Text";
actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  type HttpRequest = {
    body:Blob;
    headers:[HeaderField];
    method:Text;
    url:Text;
  };
  type HttpResponse = {
    body:Blob;
    headers:[HeaderField];
    status_code:Nat16;
    //streaming_strategy:?Strategy; //以流媒体形式传递response
  };
  type HeaderField = (Text,Text);
  public query func http_request(arg:HttpRequest) : async HttpResponse{
    {
      body=Text.encodeUtf8("Hello world!");
      headers=[];
      status_code=200;
    }
  }
};
