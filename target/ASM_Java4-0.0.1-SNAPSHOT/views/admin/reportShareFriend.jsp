<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý user</title>
 <style>
        .td-text {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
 <div class="container">
        <jsp:include page="layout/header.jsp" />

        <div class="mx-auto mt-3" style="width: 700px;">
            <nav class="nav nav-pills flex-column flex-sm-row mb-3">
                <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavorites">Favorites</a>
                <a class="flex-sm-fill text-sm-center nav-link" href="${pageContext.request.contextPath}/admin/reportFavoriteUser">Favorites Users</a>
                <a class="flex-sm-fill text-sm-center nav-link active" href="${pageContext.request.contextPath}/admin/reportShareFriend">Shared Friend</a>
            </nav>
            <form action="" class="mb-3">
              <select class="form-select" aria-label="Default select example">
                <option selected>Choose video</option>
                <option value="1">Video 1</option>
                <option value="2">Video 2</option>
                <option value="3">Video 3</option>
              </select>
            </form>
              <table class="table">
                <thead>
                    <tr>
                      <th scope="col">Sender name</th>
                      <th scope="col">Sender email</th>
                      <th scope="col">Receiver email</th>
                      <th scope="col">Favorite date</th>
                      <th scope="col">Sent date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Nguyễn Văn Tèo</td>
                      <td>teo@gmail.com</td>
                      <td>abc@gmail.com</td>
                      <td>10/11/2024</td>
                      <td>5/12/2024</td>
                    </tr>
                    <tr>
                      <td>Bùi Văn Kha</td>
                      <td>kha@gmail.com</td>
                      <td>minh@gmail.com</td>
                      <td>05/11/2023</td>
                      <td>14/12/2023</td>
                    </tr>
                  </tbody>
              </table>
        </div>
        
         <jsp:include page="layout/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>