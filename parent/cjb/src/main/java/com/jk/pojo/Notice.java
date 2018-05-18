package com.jk.pojo;



public class Notice {


    private Integer noticeid;

    private String noticename;

    private String noticedate;

    private String noticebulletin;

    public String getNoticebulletin() {
        return noticebulletin;
    }

    public void setNoticebulletin(String noticebulletin) {
        this.noticebulletin = noticebulletin;
    }

    public String getNoticedate() {

        return noticedate;
    }

    public void setNoticedate(String noticedate) {
        this.noticedate = noticedate;
    }

    public String getNoticename() {

        return noticename;
    }

    public void setNoticename(String noticename) {
        this.noticename = noticename;
    }

    public Integer getNoticeid() {

        return noticeid;
    }

    public void setNoticeid(Integer noticeid) {
        this.noticeid = noticeid;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeid=" + noticeid +
                ", noticename='" + noticename + '\'' +
                ", noticedate='" + noticedate + '\'' +
                ", noticebulletin='" + noticebulletin + '\'' +
                '}';
    }



}
