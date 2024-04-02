<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%--
       * 파일 업로드 구현 순서
       1. commons-fileupload-x.x.jar을 다운로드 및 WEB-INF/lib 폴더에 저장
       2. commons-io.x.x.jar을 다운로드 및 WEB-INF/lib 폴더에 저장
    --%>
    
    <h2>파일 업로드</h2>
    <p>파일 선택</p>
    <form action="uploadFile.jsp" method="POST"
       enctype="multipart/form-data">
       <input type="text" name="name"><br>
       <input type="file" name="files" multiple="multiple"><br>
       <input type="submit" value="파일 업로드"><br>
    </form>



</body>
</html>