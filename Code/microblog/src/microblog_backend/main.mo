import Text "mo:base/Text";
import Principal "mo:base/Principal";
import List "mo:base/List";
import Iter "mo:base/Iter";
import Time "mo:base/Time";

actor {
  public type Message = Text;
  // public type Message = {text:Text};
  public type Microblog = actor {
    follow: shared(Principal) -> async (); //添加关注对象
    follows: shared query () -> async [Principal]; //返回关注列表
    post: shared (Text) -> async (); //发布消息
    posts: shared query () -> async [Message];  //返回所有发布的消息
    timeline: shared () -> async [Message]; //返回所有关注对象发布的消息
  };
  
  stable var followed : List.List<Principal> = List.nil();
  public shared func follow(id:Principal) : async(){
    followed := List.push(id,followed);
  };
  public shared query func follows() : async [Principal]{
    List.toArray(followed);
  };
  
  stable var messages : List.List<Text> = List.nil(); 
  public shared (msg) func post(text:Text) : async (){
    assert(Principal.toText(msg.caller) == "pfdlr-37wnu-relam-o2wo5-z6rgf-q6cbt-zstl3-73xoe-7cgvo-z6d26-sae");
    messages := List.push(text,messages);
  };
  public shared query func posts() : async [Message]{
    List.toArray(messages);
  };
  public shared func timeline() : async [Message]{
    var all : List.List<Message> = List.nil();
    for (id in Iter.fromList(followed)){
      let canister : Microblog= actor(Principal.toText(id));
      let msgs = await canister.posts();
      for(msg in Iter.fromArray(msgs)){
        all := List.push(msg,all);
      }; 
    };
    List.toArray(all);
  };
};