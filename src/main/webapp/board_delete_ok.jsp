<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.BoardTO"%>
<%@ page import="model1.BoardDAO"%>

<%
request.setCharacterEncoding("utf-8");

String seq = request.getParameter("seq");
String cpage = request.getParameter("cpage");
String password = request.getParameter("password");

BoardTO to = new BoardTO();
BoardDAO dao = new BoardDAO();

to.setSeq(seq);
to.setPassword(password);

int flag = dao.boardDeleteOk(to);

out.println("<script>");

if(flag==0){
   out.println("alert(글삭제에 성공했습니다);");
   out.println("location.href='board_list.jsp'");
}else if(flag==1){
   out.println("alert(비밀번호가 틀립니다);");
   out.println("history.back()");
}else{
   out.println("alert('글삭제에 실패했습니다')");
   out.println("history.back()");
}
out.println("</script>");


%>