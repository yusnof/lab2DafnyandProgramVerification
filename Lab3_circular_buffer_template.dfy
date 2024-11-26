// class CircularMemory
// This class implements a cicular buffer with with 2 int typed pointers
class CircularMemory
{
  var cells : array<int>
  var read_position : int
  var write_position : int
  var isFlipped : bool

    constructor Init(cap : int) 
    //missing some pre-conditions here
    requires 0 <= cap
    // not sure but this should insure the output 
    ensures write_position == 0 && read_position == 0
     
    {
      //TODO 
      cells := new int[cap];
      //puts the Read and Write both to index 0 
      read_position := 0; 
      write_position := 0;
      //the flag to know: read pointer coincides with the write pointer and the buffer has been flipped 
      isFlipped := false;
    }
    
    
    //Valider to insure the input and output 
    predicate Valid() 
    reads this
    {
    //TODO 
    // Think of some constraints on: 
     // 1. cells.Length?
    // 2. write_position?
    // 3. read_position?
    cells.Length >= 0  //&& 0 <= write_position && 0 <= read_position; 
    
    } 

  method Read() returns (isSuccess : bool, content : int)
    modifies this
    requires Valid()
    ensures  Valid()
    ensures  isSuccess ==> true //TODO
    ensures !isSuccess ==> true //TODO

  {
    if(isFlipped)
    {
      //TODO
    }
    else // not flipped
    {
      //TODO
    }
  }

  method Write(input : int) returns (isSuccess : bool)
    modifies this
    requires Valid()
    ensures  Valid()
    ensures  isSuccess ==> true//TODO
    ensures !isSuccess ==> true//TODO 
  {
    if(isFlipped)
    {
      //TODO
    }
    else // not flipped
    {
      //TODO
    }
  }


}
