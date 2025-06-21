public class Test {
    public void run(){
        DocumentFactoryManager manager = new DocumentFactoryManager();

        IDocument excelDoc = manager.getFactory("excel").createDocument();
        excelDoc.create();

        IDocument pdfDoc = manager.getFactory("pdf").createDocument();
        pdfDoc.create();

        IDocument wordDoc = manager.getFactory("excel").createDocument();
        wordDoc.create();
    }
}
