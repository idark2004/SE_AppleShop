/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author phath
 */
public class ProductDTO {
    private String productID;
    private String name;
    private String description;
    private int totalQuantity;
    private double price;
    private int viewCount;
    private int orderCount;
    private boolean status;
    private String image;
    private String ram;
    private String storage;
    private String color;
    private String specID;

    public ProductDTO() {
    }

    public ProductDTO(String productID, String name, String description, int totalQuantity, double price, int viewCount, int orderCount, boolean status, String image, String ram, String storage, String color) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.totalQuantity = totalQuantity;
        this.price = price;
        this.viewCount = viewCount;
        this.orderCount = orderCount;
        this.status = status;
        this.image = image;
        this.ram = ram;
        this.storage = storage;
        this.color = color;
    }

    public ProductDTO(String productID, String name, double price, boolean status, String image, String ram, String storage, String color, String specID) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.status = status;
        this.image = image;
        this.ram = ram;
        this.storage = storage;
        this.color = color;
        this.specID = specID;
    }
    
    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSpecID() {
        return specID;
    }

    public void setSpecID(String specID) {
        this.specID = specID;
    }
    
}
