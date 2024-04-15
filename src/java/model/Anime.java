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

public class Anime {
    private int animeid;
    private String title;
    private Date releasedate;
    private String genre;

    public Anime() {
    }

    public Anime(int animeid, String title, Date releasedate, String genre) {
        this.animeid = animeid;
        this.title = title;
        this.releasedate = releasedate;
        this.genre = genre;
    }

    public int getAnimeid() {
        return animeid;
    }

    public void setAnimeid(int animeid) {
        this.animeid = animeid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(Date releasedate) {
        this.releasedate = releasedate;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    
}


