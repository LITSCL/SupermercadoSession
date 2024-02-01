<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		#indexNavegacion {
			text-align: center;
		}
		
		#mensajeBienvenido {
			text-align: center;
		}
	</style>
</head>
<body bgcolor="#FFA07A"> <!-- Aca se esta cambiando el color del body con el atributo bgcolor. -->
	<div id="mensajeBienvenido">
		<h1>
			<font color="blue">Bienvenido</font>
		</h1>
	</div>

	<nav>
		<p id="indexNavegacion">
			<a href="index.jsp">Inicio</a>
		</p>
	</nav>

	<h3>Productos disponibles:</h3>

	<form action="" method="GET">
		<label><input type="checkbox" name="articulos" value="Leche">Leche</label><br/>
		<label><input type="checkbox" name="articulos" value="Pan">Pan</label><br/>
		<label><input type="checkbox" name="articulos" value="Azucar">Azucar</label><br/>
		<label><input type="checkbox" name="articulos" value="Tallarines">Tallarines</label><br/> 
		<label><input type="checkbox" name="articulos" value="Chocolate">Chocolate</label><br/>
		<label><input type="checkbox" name="articulos" value="Arroz">Arroz</label><br/>
		<label><input type="checkbox" name="articulos" value="Carne">Carne</label><br/>

		<input type="submit" value="Anadir al carro">
	</form>

	<hr>
	<h3>Carrito de compra:</h3>
	
	<ul>
	<%
	List<String> carritoList = (List<String>)session.getAttribute("elementosSeleccionados"); //Aca esta cargando los datos de la sesión, (Si nunca se a llenado el formulario retorna null).

	if (carritoList == null) { //Se consulta se la lista esta vacia.
		carritoList = new ArrayList<String>(); //En el caso de que la lista estaba vacia se crea una nueva.
		session.setAttribute("elementosSeleccionados", carritoList); //El método setAttribue permite establecer una sesión, el primer parámtero es el nombre identificador, y el segundo parámetro es el elemento a guardar durante la sesión.
	}

	String carritoArray[] = request.getParameterValues("articulos");
	if (carritoArray != null) { //Se consulta si la lista no está vacia.
		for (String ca : carritoArray) { //Se recorre la lista utilizando un bucle for each.
			carritoList.add(ca);
		}
	}

	for (String cl : carritoList) {
		out.println("<li>" + cl + "</li>");
	}
	%>
	</ul>
</body>
</html>