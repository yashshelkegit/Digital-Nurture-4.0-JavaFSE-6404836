public class LinearSearch implements SearchingAlgorithm{

    public Product search(String name, Product[] products){

        for(int i = 0; i < products.length; i++){
            if(name.equalsIgnoreCase(products[i].productName)){
                return products[i];
            }
        }
        return null;
    }
}
