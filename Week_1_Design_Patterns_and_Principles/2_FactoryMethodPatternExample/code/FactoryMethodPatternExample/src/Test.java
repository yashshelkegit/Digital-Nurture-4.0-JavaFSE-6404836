public class Test {
    public void run(){
        DocumentFactory excelfactory = new DocumentFactoryManager().getFactory("excel");
        IDocument excelDoc = excelfactory.createDocument();
        excelDoc.create();

        DocumentFactory pdffactory = new DocumentFactoryManager().getFactory("pdf");
        IDocument pdfDoc = pdffactory.createDocument();
        pdfDoc.create();

        DocumentFactory wordfactory = new DocumentFactoryManager().getFactory("word");
        IDocument wordDoc = wordfactory.createDocument();
        wordDoc.create();
    }
}
