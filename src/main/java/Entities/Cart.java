package Entities;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<sanPham> products;

    public Cart() {
        products = new ArrayList<>();
    }

    public void addProduct(sanPham product) {
        products.add(product);
    }

    public void removeProduct(sanPham product) {
        products.remove(product);
    }

    public List<sanPham> getProducts() {
        return products;
    }
}
