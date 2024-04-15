/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author congkhoa2723
 */

    import java.util.Date;

public class Model {
    private int modelid;
    private String name;
    private double price;
    private Date releasedate;
    private String characterid;
    private String img;
    private String animeid;
    private int quantity;

    public Model(int modelid, String name, double price, Date releasedate, String characterid, String img) {
        this.modelid = modelid;
        this.name = name;
        this.price = price;
        this.releasedate = releasedate;
        this.characterid = characterid;
        this.img = img;
    }
    public Model(int modelid, String name, double price, String img,int quantity) {
        this.modelid = modelid;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Model(int modelid, String name, double price, Date releasedate, String characterid, String img, String animeid, int quantity) {
        this.modelid = modelid;
        this.name = name;
        this.price = price;
        this.releasedate = releasedate;
        this.characterid = characterid;
        this.img = img;
        this.animeid = animeid;
        this.quantity = quantity;
    }
    
    public String getAnimeid() {
        return animeid;
    }

    public void setAnimeid(String animeid) {
        this.animeid = animeid;
    }

    public Model(int modelid, String name, double price, Date releasedate, String characterid, String img, String animeid) {
        this.modelid = modelid;
        this.name = name;
        this.price = price;
        this.releasedate = releasedate;
        this.characterid = characterid;
        this.img = img;
        this.animeid = animeid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    

    public Model() {
    }

    public Model(int modelid, String name, double price, Date releasedate, String characterid) {
        this.modelid = modelid;
        this.name = name;
        this.price = price;
        this.releasedate = releasedate;
        this.characterid = characterid;
    }

    public int getModelid() {
        return modelid;
    }

    public void setModelid(int modelid) {
        this.modelid = modelid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(Date releasedate) {
        this.releasedate = releasedate;
    }

    public String getCharacterid() {
        return characterid;
    }

    public void setCharacterid(String characterid) {
        this.characterid = characterid;
    }

    
}

