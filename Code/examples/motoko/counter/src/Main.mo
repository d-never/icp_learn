import Text "mo:base/Text";
import Nat16 "mo:base/Nat16";
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
actor Counter {

  stable var counter = 0;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };
  type HttpRequest ={
    body:Blob;
    headers:[HeaderFailed];
    method:Text;
    url:Text;
  };
  type HttpResponse ={
    body:Blob;
    headers:[HeaderFailed];
    status_code:Nat16;
  };
  type HeaderFailed = (Text,Text);
  public query func http_request(arg:HttpRequest) : async HttpResponse{
    let num = Nat.toText(counter);
    {
      body=Text.encodeUtf8(num);
      headers=[];
      status_code=200;
    }
  }
};
