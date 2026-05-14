<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- useBean을 사용하여 객체 생성 --%>
<jsp:useBean id="prof" class="grade.교수" scope="page" />
<jsp:useBean id="grade" class="grade.성적" scope="page" />
<%
    // 조회 요청 데이터
    String inputProfId = "inha";
    String studentId = "20260001";

    // 조회를 위해 기존 데이터가 있다고 가정하고 세팅
    grade.성적입력(studentId, 95, 88, 92);
    
    boolean isAuth = prof.교수체크(inputProfId);
%>
<!DOCTYPE html>
<html>
<head><title>학점 조회 결과</title></head>
<body>
    <h2>[ 학점 조회 처리 결과 ]</h2>
    <% if(isAuth) { 
        String resultRank = grade.학점조회(studentId);
    %>
        <p>교수 인증 성공: <%= inputProfId %></p>
        <p>학생 ID: <%= studentId %>의 조회된 학점은 <b><%= resultRank %></b> 입니다.</p>
    <% } else { %>
        <p style="color:red;">교수 인증에 실패하였습니다.</p>
    <% } %>
</body>
</html>