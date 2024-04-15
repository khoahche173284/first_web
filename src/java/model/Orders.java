/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congkhoa2723
 */
import java.sql.Date;

public class Orders {
    private int orderid;
    private String customerid;
    private String email;
    private Date orderdate;
    private double totalamount;
    private String name;

    public Orders(int orderid, String customerid, String email, Date orderdate, double totalamount, String name) {
        this.orderid = orderid;
        this.customerid = customerid;
        this.email = email;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    public Orders() {
    }

    public Orders(String customerid, Date orderdate, double totalamount) {
        this.customerid = customerid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Orders(int orderid, String customerid, String email, Date orderdate, double totalamount) {
        this.orderid = orderid;
        this.customerid = customerid;
        this.email = email;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
    }

    public Orders(int orderid, String customerid, Date orderdate, double totalamount) {
        this.orderid = orderid;
        this.customerid = customerid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getCustomerid() {
        return customerid;
    }

    public void setCustomerid(String customerid) {
        this.customerid = customerid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(double totalamount) {
        this.totalamount = totalamount;
    }

    
}

