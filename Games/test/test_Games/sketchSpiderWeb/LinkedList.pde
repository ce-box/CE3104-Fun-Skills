public class LinkedList {
    private Node head;
    private Object data;
    private int size;

    /**
     * Lista enlazada simple
     */
    public LinkedList() {
        this.head = null;
        this.size = 0;
    }

    public int getSize() {
        return size;
    }
    
    public Object getData() {
        return data;
    }
    
    public void display(){
        Node current = this.head;
        while (current!=null){
            println(current.getData());
            current = current.getNext();
        }
    }

    public void append(LinkedList temp) {
        Node node = new Node(temp);
        Node tmp = this.head;
        if (this.head == null) {
            this.head = node;
            this.size++;
        }
        else {
            while (tmp.getNext() != null) {
                tmp = tmp.getNext();
            }
            tmp.setNext(node);
            node.setNext(null);
            this.size++;
        }
    }

    public void append(float x, float y, String word) {
        Node node = new Node(x,y,word);
        Node tmp = this.head;
        if (this.head == null) {
            this.head = node;
            this.size++;
        }
        else {
            while (tmp.getNext() != null) {
                tmp = tmp.getNext();
            }
            tmp.setNext(node);
            node.setNext(null);
            this.size++;
        }
    }
    
    public void append(Object info) {
        Node node = new Node(info);
        Node tmp = this.head;
        if (this.head == null) {
            this.head = node;
            this.size++;
        }
        else {
            while (tmp.getNext() != null) {
                tmp = tmp.getNext();
            }
            tmp.setNext(node);
            node.setNext(null);
            this.size++;
        }
    }


    public void search() {
        Node tmp = this.head;
        if (this.head == null) {
            println("0");
        }
        else {
            while (tmp.getNext() != null) {
                println(tmp.getData());
                tmp = tmp. getNext();
            }
        }
    }
    
    /**
     *Se busca nodo por medio de un indice
     * @param index
     * @return nodo
     */
    public Node getNode(int index){
        Node current = this.head;
        if (index < size) {
            for (int j = 0; j < size; j++) {
                if (index == j) {
                    return current;
                } else {
                    current = current.next;
                }
            }
        }
        return null;
    }
}
