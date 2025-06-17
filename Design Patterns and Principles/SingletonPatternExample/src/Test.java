public class Test {
    public boolean run(){
        Logger logger1 = Logger.getInstance();
        logger1.log();
        Logger logger2 = Logger.getInstance();
        logger2.log();

        return(logger1 == logger2);
    }
}
