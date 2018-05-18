package com.jk.bean.wb;

public class Notice {

    private Integer noticeid;

    private String noticename;

    private String noticedate;

    private String noticebulletin;

    public Integer getNoticeid() {
        return noticeid;
    }

    public void setNoticeid(Integer noticeid) {
        this.noticeid = noticeid;
    }

    public String getNoticename() {
        return noticename;
    }

    public void setNoticename(String noticename) {
        this.noticename = noticename;
    }

    public String getNoticedate() {
        return noticedate;
    }

    public void setNoticedate(String noticedate) {
        this.noticedate = noticedate;
    }

    public String getNoticebulletin() {
        return noticebulletin;
    }

    public void setNoticebulletin(String noticebulletin) {
        this.noticebulletin = noticebulletin;
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
