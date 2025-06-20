public class WordDocument implements IWordDocument{
    @Override
    public void create() {
        System.out.println("creating word");
    }
    @Override
    public void editText() {
        System.out.println("Editing text in Word document.");
    }
}
