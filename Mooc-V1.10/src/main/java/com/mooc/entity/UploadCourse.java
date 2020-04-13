package com.mooc.entity;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Author yangqihui
 * @Date 2020/4/13 11:46
 **/
public class UploadCourse {
    private int id;

    private String name;

    private String context;

    private String type;

    private String price;

    private String label;

    private String hour;

    private MultipartFile[] files;

    public MultipartFile[] getFile() {
        return files;
    }

    public void setFile(MultipartFile[] files) {
        this.files = files;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id ;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label == null ? null : label.trim();
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour == null ? null : hour.trim();
    }
}
