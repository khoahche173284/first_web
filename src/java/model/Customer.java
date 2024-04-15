/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congkhoa2723
 */

    public class Customer {
    private int customerid;
    private String name;
    private String email;
    private String address;
    private int loginid;

    public Customer(int customerid, String name, String email, String address, int loginid) {
        this.customerid = customerid;
        this.name = name;
        this.email = email;
        this.address = address;
        this.loginid = loginid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
   

    public Customer(int customerid, String name, String email, int loginid) {
        this.customerid = customerid;
        this.name = name;
        this.email = email;
        this.loginid = loginid;
    }

    public int getLoginid() {
        return loginid;
    }

    public void setLoginid(int loginid) {
        this.loginid = loginid;
    }
    

    public Customer() {
    }

    public Customer(int customerid, String name, String email) {
        this.customerid = customerid;
        this.name = name;
        this.email = email;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

  
}


