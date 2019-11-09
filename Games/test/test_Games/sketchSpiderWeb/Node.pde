public class Node<T> {
    public float x;
    public float y;
    public T data;
    public int score;
    Node<T> next;

    public Node(float x, float y, T word) {
        this.next=null;
        this.x = x;
        this.y = y;
        this.data=word;
    }
    
    public Node(T data) {
        this.next=null;
        this.data=data;
    }

    public Node<T> getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }
        
    
    public T getData() {
        return data;
    }
    
    public void setData(T data) {
        this.data = data;
    }
    
    public void setX(float x) {
        this.x = x;
    }
    
    public void setY(float y) {
        this.y = y;
    }
    
}
