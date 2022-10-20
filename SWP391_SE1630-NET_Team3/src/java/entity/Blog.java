/*
 * Copyright(C).
 * Transport and Information Network
 *
 * DATE            Version             AUTHOR           DESCRIPTION
 * 2022-10-18      1.0                 LongLH           First Implement
 */
package entity;

import java.util.List;

/**
 * entity blog
 * @author stick
 */
public class Blog {
    private int id;
    private int idAuthor;
    private String authorName;
    private String title;
    private String content;
    private String createAt;
    private String updateAt;
    private List<Image> listImg;

    public Blog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAuthor() {
        return idAuthor;
    }

    public void setIdAuthor(int idAuthor) {
        this.idAuthor = idAuthor;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public List<Image> getListImg() {
        return listImg;
    }

    public void setListImg(List<Image> list) {
        this.listImg = list;
    }
    public String getFirstImgSrc(){
        if(listImg == null || listImg.isEmpty()){
            return "";
        }
        return this.listImg.get(0).getImgSource();
    }
    public String getDayCreate(){
        return getCreateAt().split("-")[2];
    }
    public String getMonthYearCreate(){
        String s = getCreateAt().split("-")[0] + "-" + getCreateAt().split("-")[1];
        return s;
    }
}
