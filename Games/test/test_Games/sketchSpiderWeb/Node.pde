public class Node {
    public float x;
    public float y;
    public Object data;
    Node next;

    public Node(float x, float y, Object word) {
        this.next=null;
        this.x = x;
        this.y = y;
        this.data=word;
    }
    
    public Node(Object data) {
        this.next=null;
        this.data=data;
    }

    public Node getNext() {
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
        
    
    public Object getData() {
        return data;
    }
    
    public void setData(Object data) {
        this.data = data;
    }
    
    public void setX(float x) {
        this.x = x;
    }
    
    public void setY(float y) {
        this.y = y;
    }
}
