<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Welcome</title>
</head>
<body>
	<div class="container">
	<ex:NavBar/>
	<h1>Welcome Home</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum dignissimos quae vel animi sequi consectetur ducimus voluptatibus sint earum inventore fugit modi tenetur cum eveniet assumenda odit fugiat. Soluta repudiandae!</p>	
	
	<h2>Description</h2>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa architecto placeat deserunt odio hic quis reprehenderit tempora doloribus blanditiis debitis voluptates odit. Beatae sit consectetur porro explicabo veritatis dolorem impedit.</p>
	<p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni at mollitia aspernatur velit beatae dolorem? Consequuntur aut facere excepturi quaerat doloremque similique error illum unde perferendis accusamus libero sed aspernatur!</span>
	<span>Unde officia omnis rerum nam voluptatem mollitia nemo debitis ipsa quia consequatur eveniet possimus molestias cupiditate magni dolor ipsam dolore vitae odit delectus iusto tenetur corporis accusamus praesentium doloremque optio!</span>
	<span>Numquam suscipit eos ratione tempore laudantium impedit laborum molestias earum nobis. Cumque ipsam qui adipisci iusto vitae dolore odit odio sapiente excepturi quis autem reiciendis aperiam doloribus natus officiis repellat.</span>
	<span>Autem neque ullam quaerat maiores aspernatur in sit consequatur hic itaque accusantium. Numquam omnis repudiandae beatae quis laudantium ad officia iste unde voluptates eos aliquid fugit itaque. Debitis illo dicta!</span>
	<span>Doloremque non error blanditiis iusto tenetur quae nam sed velit quia fugiat ullam fugit neque deserunt itaque amet accusamus sequi rem optio quasi placeat atque ipsa molestiae repellat nihil laudantium!</span>
	<span>Quis minus porro eveniet quos nemo numquam adipisci magnam nobis velit odio ea veniam in eligendi autem nulla dolores delectus odit incidunt enim ut blanditiis. Vel doloribus est dignissimos reiciendis!</span></p>

	<h3 style="color:red"><i class="fa-solid fa-location-dot"></i> Write a Post Now!</h3>
	<p>You can Write a Post Right below Here by clicking this button! <br />
	There is also a menubar upside, u can check the posts! on the board</p>
	<ex:writeButton/>
	</div>
</body>
</html>