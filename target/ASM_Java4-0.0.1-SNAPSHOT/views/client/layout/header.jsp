<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg bg-warning rounded">
            <div class="container-fluid">
              <a class="navbar-brand fw-bold text-danger" href="${pageContext.request.contextPath}/">ONLINE ENTERTAINMENT</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                	<c:choose>
				        <c:when test="${not empty sessionScope.currentUser}">
				        	<c:if test="${sessionScope.currentUser.admin}">
					           	<li class="nav-item">
			                    	<a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/admin">Admin</a>
			                  	</li>
		                  	</c:if>
		                  	<li class="nav-item">
		                    	<a class="nav-link fw-bold text-primary" href="${pageContext.request.contextPath}/videoFavorite">My Favorites</a>
		                  	</li>
				        </c:when>
				      </c:choose>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-primary fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      My Account
                    </a>
                    <ul class="dropdown-menu">
                    <c:choose>
				        <c:when test="${not empty sessionScope.currentUser}">
				          	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
                     		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/editProfile">Edit Profile</a></li>
                      		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/signout">Loggoff</a></li>
				        </c:when>
				        <c:otherwise>
				         	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/signin">Login</a></li>
				         	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Registration</a></li>
				         	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a></li>
				        </c:otherwise>
				      </c:choose>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
        </nav>