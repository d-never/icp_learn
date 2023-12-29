import Nat "mo:base/Nat";
import Text "mo:base/Text";
actor {
  
  func fib(n:Nat) : Nat{
    if(n<=1){
      1
    } else{
      fib(n-1) + fib(n-2)
    }
  };

  public query func fibonacci(n:Nat): async Nat{
    return fib(n)
  };
  

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
