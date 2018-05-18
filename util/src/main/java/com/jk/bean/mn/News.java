package com.jk.bean.mn;

public class News {

    private Integer newsId;
    private String newsName;
    private String newsTime;
    private String newsNeirun;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsName() {
        return newsName;
    }

    public void setNewsName(String newsName) {
        this.newsName = newsName;
    }

    public String getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(String newsTime) {
        this.newsTime = newsTime;
    }

    public String getNewsNeirun() {
        return newsNeirun;
    }

    public void setNewsNeirun(String newsNeirun) {
        this.newsNeirun = newsNeirun;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", newsName='" + newsName + '\'' +
                ", newsTime='" + newsTime + '\'' +
                ", newsNeirun='" + newsNeirun + '\'' +
                '}';
    }
}
