public class Main {

    public static void main (String[] arg){

        CircularBuffer<Integer> circularBuffer = new CircularBuffer<Integer> (3); 
        circularBuffer.write(2);
        circularBuffer.write(1); 
        circularBuffer.write(2);
        circularBuffer.write(3);
       
        circularBuffer.read();  
        circularBuffer.read();  
        circularBuffer.read();  
        circularBuffer.read(); 
        circularBuffer.write_toConsole(); 
        
    }
    
}
