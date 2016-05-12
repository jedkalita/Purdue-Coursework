import org.antlr.v4.runtime.*;
//import org.antlr.runtime.*;
//import org.antlr.runtime.tree.*;
import org.antlr.runtime.debug.*;
import org.stringtemplate.v4.*;
import java.io.IOException;



public class Micro {
	public static void main(String[] args) throws IOException {
		ANTLRFileStream input = new ANTLRFileStream(args[0]);
		MicroLexer lexer = new MicroLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		tokens.setTokenSource(lexer);
		//ParseTreeBuilder builder = new ParseTreeBuilder("program");
		MicroParser parser = new MicroParser(tokens);
		
		/*
		ANTLRErrorStrategy es = new CustomErrorStrategy();
		parser.setErrorHandler(es);
		try {
		    System.out.println("In try block");
		    parser.program();
		    System.out.println("Accepted");
		    
		}
		catch (RecognitionException re) {
		    System.out.println("In catch block");
		    
		}
		*/
		
		ANTLRErrorStrategy es = new CustomErrorStrategy();
                try{
		parser.setErrorHandler(es);
		parser.program();
		//System.out.print("Accepted\r\n");
		}
                catch (RuntimeException e){
		}
		//System.out.println("Here now!");
		
		//System.out.println(parser.getTree().toStringTree());
		
		//boolean check = parser.getBuildParseTree();
		//System.out.println(check);
		//ParseInfo parseinfo = parser.getParseInfo();
		//System.out.println(parseinfo);
		/*
		if (check == true){
		    System.out.println("Accepted");
		}
		else{
		    System.out.println("Not Accepted");
		}
		*/
		
		/*
		CommonTree tree = (CommonTree) parser.parse().getTree();
		DOTTreeGenerator gen = new DOTTreeGenerator();
		StringTemplate st = gen.toDOT(tree);
		System.out.println(st);
		*/
	      
		//System.out.println("Tokens: " + tokens);
		/*
		Token tok = lexer.nextToken();
		while (tok.getType() != lexer.EOF)
		    {
			
			String type_tok = tokenType(tok.getType());
			String value_tok = tok.getText();
			if (type_tok != "WHITESPACE" 
			    && 
			    type_tok != "COMMENT") {
			    System.out.println("Token Type: " + type_tok);
			    System.out.println("Value: " + value_tok);
			}
			tok = lexer.nextToken();
		    }
		*/
	}

    public static String tokenType(int tok_id) {
	String type_tok = null;
	switch (tok_id) {
	case MicroLexer.WHITESPACE:
	    type_tok = "WHITESPACE";
	    break;

	case MicroLexer.IDENTIFIER:
	    type_tok = "IDENTIFIER";
	    break;
	case MicroLexer.INTLITERAL:
	    type_tok = "INTLITERAL";
	    break;
	case MicroLexer.FLOATLITERAL:
	    type_tok = "FLOATLITERAL";
	    break;
	case MicroLexer.STRINGLITERAL:
	    type_tok = "STRINGLITERAL";
	    break;
	case MicroLexer.COMMENT:
	    type_tok = "COMMENT";
	    break;
	case MicroLexer.KEYWORD:
	    type_tok = "KEYWORD";
	    break;
	case MicroLexer.OPERATOR:
	    type_tok = "OPERATOR";
	    break;
	default:
	    break;
	}
	return type_tok;
    }
	    
}