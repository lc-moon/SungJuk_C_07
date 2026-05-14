```mermaid
sequenceDiagram
    autonumber
    actor ProfessorActor as 교수
    
    %% 바운더리 클래스 및 엔티티 클래스 정의
    participant UI as <<boundary>><br/>Add_Sungjuk_UI
    participant Prof as 교수
    participant Grade as 성적

    ProfessorActor->>+UI: 성적입력 요청(교수id, 학생id, 자바, DB, 보안)
    
    %% 교수 체크 단계
    UI->>+Prof: 교수체크(교수id)
    Note over Prof: id가 "inha"인지 확인
    Prof-->>-UI: boolean (인증 결과)

    alt 인증 성공 (true)
        %% 성적입력 및 계산 단계
        UI->>+Grade: 성적입력(학생id, 자바, DB, 보안)
        
        Note right of Grade: 내부 계산 로직 수행
        Grade->>Grade: 총점()
        Grade->>Grade: 평균()
        
        Grade-->>-UI: 성적 입력 및 계산 완료
        UI-->>ProfessorActor: 성공 메시지 표시
    else 인증 실패 (false)
        UI-->>-ProfessorActor: "교수 인증에 실패했습니다." 메시지 표시
    end