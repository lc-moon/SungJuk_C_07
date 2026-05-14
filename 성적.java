package grade;

public class 성적 {
    private String 학생id;
    private int 자바;
    private int DB;
    private int 보안;
    private int 총점;
    private float 평균;
    private String 학점;

    public void 성적입력(String 학생id, int 자바, int DB, int 보안) {
        this.학생id = 학생id;
        this.자바 = 자바;
        this.DB = DB;
        this.보안 = 보안;
        총점(); // 내부 호출
        평균(); // 내부 호출
    }

    public void 총점() {
        this.총점 = this.자바 + this.DB + this.보안;
    }

    public void 평균() {
        this.평균 = this.총점 / 3.0f;
    }

    public String 학점조회(String 학생id) {
        // A학점: 90점 이상, B학점: 80점 이상, C학점: 80점 미만
        if (this.평균 >= 90) {
            this.학점 = "A";
        } else if (this.평균 >= 80) {
            this.학점 = "B";
        } else {
            this.학점 = "C";
        }
        return this.학점;
    }

    // 결과 출력을 위한 Getter
    public int get총점() { return 총점; }
    public float get평균() { return 평균; }
    public String get학생id() { return 학생id; }
}
