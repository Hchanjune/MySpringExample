<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:url value="/home/main" var="mainLink"></c:url>
<c:url value="/board/list" var ="boardLink"></c:url>
<c:url value="/board/list" var ="search"></c:url>

<nav class="navbar navbar-expand-sm bg-light">
  <div class="container-fluid">
    <i class="fa-solid fa-leaf"> My Spring</i><!-- <a class="navbar-brand" href="#">Navbar</a> -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${mainLink }"><i class="fa-solid fa-house"> HOME</i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${boardLink }"><i class="fa-solid fa-bars-staggered"> Board</i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form action="${search }" class="d-flex" role="search" method="post">
        <input class="form-control me-2" name="value" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>