import java.util.*;

public class ASTnode {
    public String text; //each node will have one element which contains the value
    public ASTnode leftChild; //the left node which might point to a node or be null
    public ASTnode rightChild; //the right node which might point to a node or be null
    
    public ASTnode(String text, ASTnode leftChild, ASTnode rightChild) {
	this.text = text;
	this.leftChild = leftChild;
	this.rightChild = rightChild;
    }   
}
