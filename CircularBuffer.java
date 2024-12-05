
class CircularBuffer<T> {

    private T[] array;
    private int read_position;
    private int write_position;
    private boolean isFlipped;

    // insure the new object has correct value
    @SuppressWarnings("unchecked")
    public CircularBuffer(int capacity) {
        if (capacity <= 0) {
            throw new IllegalArgumentException("invalid input, no input below 1");
        }
        array = (T[]) new Object[capacity];
        read_position = 0;
        write_position = 0;
        isFlipped = false;
    }

    public Object read() {

        int position = read_position % array.length;

        Object temp = array[position];

        read_position = position + 1;

        return temp;
    }

    public boolean write(T input) {

        boolean flag = true;
        int position = write_position % array.length;
        if (position < 0 || position > array.length) {
            flag = false;
            return flag;
        }

        if (position == array.length - 1) {
            isFlipped = true;
        }

        array[position] = input;
        write_position = position + 1;

        return flag;
    }

    public boolean isEmpty() {
        return (!isFlipped && read_position == write_position);
    }

    public boolean isFull() {
        return isFlipped && write_position % array.length == read_position % array.length;
    }

    public void write_toConsole() {
        for (int i = 0; i < array.length; i++) {
            System.out.print("[" + array[i] + "]");
        }

        System.out.println();
        for (int i = 0; i < array.length; i++) {
            if (write_position == i) {
                System.out.print("[" + "W" + "]");
            }

            else {
                System.out.print("[ ]");
            }
        }
        System.out.println();
        for (int i = 0; i < array.length; i++) {
            if (read_position == i) {
                System.out.print("[" + "R" + "]");
            }

            else {
                System.out.print("[ ]");
            }
        }

    }

}