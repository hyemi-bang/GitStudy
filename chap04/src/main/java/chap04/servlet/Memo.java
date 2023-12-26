package chap04.servlet;

public class Memo {
    private String content;
    private String userid;

    public Memo(String content, String userid) {
        this.content = content;
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public String getUsername() {
        return userid;
    }
}