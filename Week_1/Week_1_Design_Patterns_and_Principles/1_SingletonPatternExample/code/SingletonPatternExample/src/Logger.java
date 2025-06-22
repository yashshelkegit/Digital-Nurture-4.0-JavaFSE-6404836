public class Logger {

    private static Logger instance = null;
    private Logger(){}
    public static Logger getInstance(){
        if(Logger.instance != null){
            return instance;
        } else {
            return instance = new Logger();
        }
    }
    public void log(){
        System.out.println("Logged");
    }
}