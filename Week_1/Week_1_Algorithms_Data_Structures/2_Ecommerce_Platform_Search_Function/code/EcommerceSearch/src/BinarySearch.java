public class BinarySearch implements SearchingAlgorithm{
    @Override
    public Product search(String name, Product[] products){
        int left = 0;
        int right = products.length - 1;

        while(left <= right){
            int mid = left + (right - left) / 2;
            int comparison = products[mid].productName.compareToIgnoreCase(name);

            if (comparison == 0) {
                return products[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }
}

