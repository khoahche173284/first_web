/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congkhoa2723
 */
public class OrderItem {
    private int orderitemid;
    private int orderid;
    private int modelid;
    private int quantity;
    private int total;
    private int price;
    private String name;

    public OrderItem(int orderitemid, int orderid, int modelid, int quantity, int total, int price, String name) {
        this.orderitemid = orderitemid;
        this.orderid = orderid;
        this.modelid = modelid;
        this.quantity = quantity;
        this.total = total;
        this.price = price;
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   

   
    

    public OrderItem(int orderitemid, int orderid, int modelid, int quantity, int total) {
        this.orderitemid = orderitemid;
        this.orderid = orderid;
        this.modelid = modelid;
        this.quantity = quantity;
        this.total = total;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    


    
    public OrderItem() {
    }

   

    public int getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(int orderitemid) {
        this.orderitemid = orderitemid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getModelid() {
        return modelid;
    }

    public void setModelid(int modelid) {
        this.modelid = modelid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   
}

