<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
        
 		 <div class="row">
            <div class="col-12 col-lg-8">
                <div class="mt-3">
                    <iframe width="100%" height="350" src="https://www.youtube.com/embed/iJodbd8CQPA" title="YouTube video player" frameborder="0" allowfullscreen></iframe>
                    <h5 class="mt-2">Nhạc Chill Buồn Tâm Trạng | Nhạc Buồn Xu Hướng TikTok - Những Bản Lofi Buồn Chill Nhẹ Nhàng Hay Nhất</h5>
                    <span>Mô tả: Nhạc Chill Buồn Tâm Trạng | Nhạc Buồn Xu Hướng TikTok - Những Bản Lofi Buồn Chill Nhẹ Nhàng Hay Nhất
                    Nhạc Chill Buồn Tâm Trạng | Những Bản Lofi Buồn Chill Nhẹ Nhàng Hay Nhất - Nhạc Buồn Xu Hướng TikTok
                    Nhạc Buồn TikTok - Nhạc Chill Buồn Tâm Trạng 2024 | Những Bản Lofi Buồn Chill Nhẹ Nhàng Hay Nhất</span>
                    <div class="mt-3">
                        <button class="btn btn-primary">Like</button>
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalShareVideo">Share</button>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="list-group list-group-flush border border-1">
                    <div class="mt-3" id="pills-tabContent"
                        style="height: 425px;">
                            <a href="#" class="mt-2 text-decoration-none">
                                <div class="card border-0 mx-3">
                                    <div class="row g-0 card-episode-new p-0">
                                        <div class="col-4 overflow-hidden">
                                            <img src="https://i.ytimg.com/vi/UvpRKctZdFA/hq720.jpg" class="w-100 rounded-start card-content-img" style="object-fit: cover">
                                        </div>
                                        <div class="col-8">
                                            <div class="card-body p-0 ms-3" ng-class="{'text-danger': id==item.idTapphim}">
                                                <h6 ng-bind="item.tenTapphim" class="td-text">Some quick example text to build on the card title and make up the bulk of the card's content</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="#" class="mt-2 text-decoration-none">
                                <div class="card border-0 mx-3">
                                    <div class="row g-0 card-episode-new p-0">
                                        <div class="col-4 overflow-hidden">
                                            <img src="https://i.ytimg.com/vi/UvpRKctZdFA/hq720.jpg" class="w-100 rounded-start card-content-img" style="object-fit: cover">
                                        </div>
                                        <div class="col-8">
                                            <div class="card-body p-0 ms-3" ng-class="{'text-danger': id==item.idTapphim}">
                                                <h6 ng-bind="item.tenTapphim" class="td-text">Some quick example text to build on the card title and make up the bulk of the card's content</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                    </div>
                </div>
                </div>
        </div>

         <jsp:include page="layout/footer.jsp" />
    </div>
     <div class="modal" tabindex="-1" id="modalShareVideo">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Send video to yout friend</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Your friend's email?</label>
                    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                  </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Send</button>
            </div>
          </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
</body>
</html>