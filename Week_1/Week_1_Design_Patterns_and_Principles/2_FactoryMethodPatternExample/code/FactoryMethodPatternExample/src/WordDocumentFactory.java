public class WordDocumentFactory extends DocumentFactory{
    public IDocument createDocument(){
        return new WordDocument();
    }
}
