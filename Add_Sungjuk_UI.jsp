<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- useBean을 사용하여 객체 생성 (new 키워드 대체) --%>
<jsp:useBean id="prof" class="grade.교수" scope="page" />
<jsp:useBean id="grade" class="grade.성적" scope="page" />
<%
    // 하드코딩된 입력 데이터
    String inputProfId = "inha";
    String studentId = "20260001";
    int javaScore = 95, dbScore = 88, securityScore = 92;

    // useBean으로 생성된 prof 객체 사용
    boolean isAuth = prof.교수체크(inputProfId);
%>
<!DOCTYPE html>
<html>
<head><title>성적 입력 결과</title></head>
<body>
    <h2>[ 성적 입력 처리 결과 ]</h2>
    <% if(isAuth) { 
        // useBean으로 생성된 grade 객체 사용
        grade.성적입력(studentId, javaScore, dbScore, securityScore);
    %>
        <p>교수 인증 성공: <%= inputProfId %></p>
        <p>학생 ID: <jsp:getProperty name="grade" property="학생id" /> 성적 입력 완료</p>
        <p>계산 결과 - 총점: <jsp:getProperty name="grade" property="총점" />, 
           평균: <%= String.format("%.2f", grade.get평균()) %></p>
    <% } else { %>
        <p style="color:red;">교수 인증에 실패하였습니다.</p>
    <% } %>
</body>
</html>