public class Test {
    public void run(){
        DocumentFactory excelFactory = new DocumentFactoryManager().getFactory("excel");
        IDocument excelDoc = excelFactory.createDocument();
        excelDoc.create();

        DocumentFactory pdfFactory = new DocumentFactoryManager().getFactory("pdf");
        IDocument pdfDoc = pdfFactory.createDocument();
        pdfDoc.create();

        DocumentFactory wordFactory = new DocumentFactoryManager().getFactory("word");
        IDocument wordDoc = wordFactory.createDocument();
        wordDoc.create();
    }
}
