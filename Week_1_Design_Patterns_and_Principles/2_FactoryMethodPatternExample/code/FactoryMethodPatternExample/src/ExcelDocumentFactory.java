
public class ExcelDocumentFactory extends DocumentFactory{
    public IDocument createDocument(){
        return new ExcelDocument();
    }
}
