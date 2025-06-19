public class DocumentFactoryManager {
    public DocumentFactory getFactory(String doc){
        switch (doc.toUpperCase()){
            case "WORD": return new WordDocumentFactory();
            case "EXCEL": return new ExcelDocumentFactory();
            case "PDF": return new PdfDocumentFactory();
            default: return null;
        }
    }
}
