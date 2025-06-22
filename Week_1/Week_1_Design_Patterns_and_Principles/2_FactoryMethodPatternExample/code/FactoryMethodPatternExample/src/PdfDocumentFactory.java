

public class PdfDocumentFactory extends DocumentFactory {
    public IDocument createDocument(){
        return new PdfDocument();
    }
}
