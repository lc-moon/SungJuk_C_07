```mermaid
classDiagram
    class 교수 {
        -교수id: String
        +교수체크(id: String) boolean
    }

    class 성적 {
        -학생id: String
        -자바: int
        -DB: int
        -보안: int
        -총점: int
        -평균: float
        -학점: String
        +성적입력(학생id: String, 자바: int, DB: int, 보안: int) void
        +학점조회(학생id: String) String
        +총점() void
        +평균() void
    }

    class Add_Sungjuk_UI {
        <<boundary>>
        +입력화면표시() void
        +입력값전달() void
    }

    class Search_Sungjuk_UI {
        <<boundary>>
        +조회화면표시() void
        +조회요청전달() void
    }

    Add_Sungjuk_UI --> 교수 : 교수체크 요청
    Add_Sungjuk_UI --> 성적 : 성적입력 요청
    Search_Sungjuk_UI --> 교수 : 교수체크 요청
    Search_Sungjuk_UI --> 성적 : 학점조회 요청