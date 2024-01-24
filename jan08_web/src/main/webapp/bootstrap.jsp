<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Grayscale 멋진 테마</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">c23c_15의 게시판</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="./board">게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="./notice">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="./qna">QnA</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">HELL JAVA</h1>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">A programmer is someone who solves a problem you didn't know you had in a way you don't understand.</h2>
                        <a class="btn btn-primary" href="./index">시작하기</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->

        <section style="background-color: black;">
        <div class="mt-4">
        </div>
        <br>
		<div class="m-5 p-5">
			<table class="table table-dark table-borderless border border-success" >
				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th class="col-6">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-2">날짜</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="row">
					<tr>
						<td class="col-1">${row.no }</td>
						<td class="col-1">${row.title}</td>
						<td class="col-1">${row.write}</td>
						<td class="col-1">${row.date}</td>
						<td class="col-1">${row.count}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
        </section>
        <button type="button" class="mx-5 btn btn-dark">글쓰기</button>
        
        <div class="container bg-warning text-dark"> <!-- 컨테이너 구역 -->
        	구역1
        	<div class="m-5 mb-0 bg-success">구역2</div>
        	<div class="mx-2 my-4 py-5 bg-danger">구역3	</div>
			<div class="my-2 bg-secondary w-25"> 구역4</div>
        	<div class="my-2 bg-secondary w-50">구역5</div>
        	<div class="my-2 bg-secondary w-75">구역6</div><br>
        </div><br>
        
        
        
        
        <!-- Projects-->

                <!-- Project One Row-->

                <!-- Project Two Row-->

        <!-- Signup-->

        <!-- Contact-->
        <section class="contact-section bg-black">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Address</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">중앙정보처리학원 6층 1호 15번</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-envelope text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Email</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50"><a href="#!">hell@java.lol</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-mobile-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Phone</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">+82 010-123333-4455678 </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social d-flex justify-content-center">
                    <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </section>
        


        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Your Website 2023</div></footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
    