```mermaid
graph LR
    교수((교수))
    UC1([성적입력])
    UC2([학점조회])
    UC3([교수체크])

    교수 --- UC1
    교수 --- UC2
    UC1 -. "&lt;&lt;include&gt;&gt;" .-> UC3
    UC2 -. "&lt;&lt;include&gt;&gt;" .-> UC3