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
    ensures write_position == 0 && read_position == 0 && isFlipped == false && isEmpty() && !isFull()
     
    {
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
    cells.Length >= 0  && 0 <= write_position && 0 <= read_position 
    } 
  
  // A predicate indicating no more Read available
  predicate isEmpty()
  reads this
  {
  cells.Length >= 0 && !isFlipped && read_position == write_position
  }

  //A predicate indicating no more Write should be allowed
  predicate isFull()
    reads this
  {
  cells.Length >= 0 && isFlipped && read_position == write_position
  }

//this is not correct but will review this later 
  method Read() returns (isSuccess : bool, content : int)
    modifies this
    
    requires Valid() && read_position < cells.Length 
    ensures  Valid()
    ensures  isSuccess ==> true//read_position == read_position + 1 
    ensures !isSuccess ==> true //TODO

  {
   
    if(!isFlipped)
    {
      isSuccess := true; 
      content := cells[read_position]; 
      read_position := read_position + 1 ;
       if(read_position == write_position){
      isFlipped := true; 
    } 
      
    }
    else // flipped
    {
     read_position := 0;  
      content := cells[read_position];
       if(read_position == write_position){
      isFlipped := true; 
    }
    isSuccess := true;
    read_position := read_position + 1 ;
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
