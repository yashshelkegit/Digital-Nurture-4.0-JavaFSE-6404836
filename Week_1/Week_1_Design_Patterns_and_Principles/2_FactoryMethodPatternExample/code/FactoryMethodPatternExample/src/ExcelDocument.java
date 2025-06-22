public class ExcelDocument implements IExcelDocument{
    @Override
    public void create() {
        System.out.println("Creating Excel");
    }

    @Override
    public void importTable(){
        System.out.println("Importing table");
    }


}
