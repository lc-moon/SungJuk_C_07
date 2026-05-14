package grade;

public class 교수 {
    private String 교수id;

    public boolean 교수체크(String id) {
        // 교수id가 "inha"인 경우에만 true 반환
        return "inha".equals(id);
    }
}
