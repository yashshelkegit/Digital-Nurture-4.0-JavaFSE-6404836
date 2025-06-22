

public class PdfDocument implements IPdfDocument {

    @Override
    public void create(){
        System.out.println("creating pdf");
    }

    @Override
    public boolean search(String text){
        System.out.println("Searching for text: "+text);
        return false;
    }
}
