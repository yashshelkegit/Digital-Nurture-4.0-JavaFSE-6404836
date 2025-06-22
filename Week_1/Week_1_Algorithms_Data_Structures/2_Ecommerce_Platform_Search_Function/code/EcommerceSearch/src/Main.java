import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        int n = 5;
        Product[] products = new Product[n];

        for(int i = 0; i < n; i++){
            products[i] = new Product(i+1, "Product"+(i+1), "C"+((i%2)+1));
        }

        System.out.println("Products :");
        for(int i = 0; i < n; i++){
            System.out.println(products[i]);
        }

        System.out.println("Search Result");

        Product product = new LinearSearch().search("Product3", products);
        System.out.println((product != null)? "Found :" + product : "Not Found");

        Arrays.sort(products, new ProductComparator());

        product = new BinarySearch().search("Product3", products);
        System.out.println((product != null)? "Found :" + product : "Not Found");

        product = new LinearSearch().search("Product8", products);
        System.out.println((product != null)? "Found :" + product : "Not Found");
        product = new BinarySearch().search("Product8", products);
        System.out.println((product != null)? "Found :" + product : "Not Found");
    }
}