public class LinkedList<T> {
    private Node<T> head;
    private T data;
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
    
    public T getData() {
        return data;
    }
    
    public void display(){
        Node<T> current = this.head;
        while (current!=null){
            println(current.getData());
            current = current.getNext();
        }
    }

    public void append(LinkedList<T> temp) {
        Node<T> node = new Node(temp);
        Node<T> tmp = this.head;
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

    public void append(float x, float y, T word) {
        Node<T> node = new Node(x,y,word);
        Node<T> tmp = this.head;
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
    
    public void append(T info) {
        Node<T> node = new Node(info);
        Node<T> tmp = this.head;
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
        Node<T> tmp = this.head;
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
    public Node<T> getNode(int index){
        Node<T> current = this.head;
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
