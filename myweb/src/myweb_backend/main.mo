import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
actor {
  
  func quicksort(arr:[var Int], l:Nat, r:Nat) {    

    if (l < r){
      var i=l; var j =r; var x =arr[i];
      while( i < j ){
        while( i < j and arr[j] > x){
          j -=1;
        };
        if (i < j) {
          arr[i] := arr[j];
          i+=1;
        };
        while (i < j and arr[i] < x) {
          i+=1;
        };
        if (i < j){
          arr[j] := arr[i];
          j -=1;
        };
      };
      arr[i] := x;
      quicksort(arr,l,i-1);
      quicksort(arr,i+1,r);
    };
  };
  public func qsort(arr:[Int]) : async [Int]{
    let len = arr.size();
    // let arr_v = Buffer.Buffer<Int>(len);
    // for (i in arr.vals()){
    //   arr_v.add(i);
    // };
    // let arr_s = Buffer.toArray(arr_v);
    let arr_s = Array.thaw<Int>(arr);
    quicksort(arr_s,0,len-1);
    Array.freeze<Int>(arr_s);
  };

  //public query func fibonacci(n:Nat): async Nat{
  //  return fib(n)
  //};

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
