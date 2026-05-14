```mermaid
sequenceDiagram
    autonumber
    actor ProfessorActor as 교수
    
    %% 스테레오타입을 활용한 바운더리 클래스 표기
    participant UI as <<boundary>><br/>Search_Sungjuk_UI
    participant Prof as 교수
    participant Grade as 성적

    ProfessorActor->>+UI: 학점조회 요청(교수id, 학생id)
    
    %% 교수 체크 단계 (필수 사항)
    UI->>+Prof: 교수체크(교수id)
    Note over Prof: id가 "inha"인지 확인
    Prof-->>-UI: boolean (인증 결과)

    alt 인증 성공 (true)
        %% 학점조회 및 부여 단계
        UI->>+Grade: 학점조회(학생id)
        
        Note right of Grade: 점수 기반 학점 부여 로직<br/>(A:90↑, B:80↑, C:80↓)
        Grade-->>-UI: String (부여된 학점 결과)
        
        UI-->>ProfessorActor: 학점 결과 화면 표시
    else 인증 실패 (false)
        UI-->>-ProfessorActor: "교수 인증에 실패했습니다." 메시지 표시
    end