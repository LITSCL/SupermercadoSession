<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	List<String> carritoList = (List<String>)session.getAttribute("elementosSeleccionados"); //Aca esta cargando los datos de la sesi�n, (Si nunca se a llenado el formulario retorna null).

	if (carritoList == null) { //Se consulta se la lista esta vacia.
		carritoList = new ArrayList<String>(); //En el caso de que la lista estaba vacia se crea una nueva.
		session.setAttribute("elementosSeleccionados", carritoList); //El m�todo setAttribue permite establecer una sesi�n, el primer par�mtero es el nombre identificador, y el segundo par�metro es el elemento a guardar durante la sesi�n.
	}

	String carritoArray[] = request.getParameterValues("articulos");
	if (carritoArray != null) { //Se consulta si la lista no est� vacia.
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