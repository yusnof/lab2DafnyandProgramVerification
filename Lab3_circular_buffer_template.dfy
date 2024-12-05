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
    ensures write_position == 0 && read_position == 0 && !isFlipped && isEmpty() && !isFull()

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
    cells.Length >= 0  && 0 <= write_position < cells.Length && 0 <= read_position < cells.Length
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
  method Read() returns (isSuccess: bool, content: int)
    modifies this`isFlipped, this`read_position
    requires Valid()
    ensures Valid() 
    ensures isSuccess ==> cells[(old (read_position)) % cells.Length] == content && old(read_position) == (read_position - 1) % cells.Length
    ensures isSuccess ==> exists read_position :: 0 <= read_position < cells.Length && cells[read_position] == content
    ensures !isSuccess ==> old(read_position) == read_position
  {
    if read_position < cells.Length {
      content := cells[read_position % cells.Length];
      isSuccess := true;
      read_position := (read_position + 1) % cells.Length;
      if(read_position == cells.Length - 1 ){
        isFlipped := !isFlipped;
      }

    } else {
      isSuccess := false;
    }
  }



  method Write(input : int) returns (isSuccess : bool)
    modifies this.cells, this`write_position, this`isFlipped 
    requires Valid()  
    ensures  Valid()
    ensures  isSuccess ==> cells[(old(write_position)) % cells.Length] == input 
    ensures !isSuccess ==> (cells[write_position % cells.Length ] != input) && (old(write_position) == write_position)
  {
    if (write_position < cells.Length)
    {
      
      this.cells[write_position % cells.Length] := input;
      isSuccess := true;
      write_position := (write_position + 1) % cells.Length;
      if(write_position == cells.Length - 1 || write_position == read_position){
        isFlipped := !isFlipped;
      }
  
    }
    else {
      isSuccess := false;
    }
 
  }


}
