//Aplicación Desarrollada por Angel Nicolás ROJAS 
//Para el curso  FULLCODER-Curso Introductorio- Comisión 18/21659
//DEFINICION DE MODULOS
Funcion crear_lista_productos (cantidad, producto,cant_prod)
	//Función para cargar inicialmente los productos con sus respectivas cantidades iniciales
	//Está función almacenara los datos(productos y cantidad) en vectores distintos, asociados con sus índices
	Para i<-1 Hasta cantidad Con Paso 1 Hacer
		Escribir "Ingrese Producto: "
		leer producto[i]
		Escribir "Ingrese la cantidad de productos: "
		leer cant_prod[i]
	Fin Para	
Fin Funcion

Funcion mostrar_productos(cantidad, producto, cant_prod)
	//Funcion que permite listar todos los productos almacenados y su cantidad en stock
	Para i<-1 Hasta cantidad Con Paso 1 Hacer
		Escribir "Producto: ",producto[i], " cantidad: ",cant_prod[i]
	Fin Para
FinFuncion

Funcion pos<- buscar_producto(cantidad, producto)
	//Función que se encargara de seleccionar el producto que estan solicitando(para la venta)
	Escribir "=========Lista de Productos========="
	Escribir "Seleccione un codigo de producto: "
	Para i<-1 Hasta cantidad Con Paso 1 Hacer
		Escribir i,"- ",producto[i]
	Fin Para
	Leer pos
FinFuncion

Funcion retirar_productos(cantidad, lista_prod, lista_cant)
	pos=buscar_producto(cantidad, lista_prod)
	//Pedir al usuario que nos indique la cantidad de productos que desea
	Escribir "¿Cuantos productos desea? (máx ",lista_cant[pos],".)" //Aqui le indicamos por pantada cuanto es la cantidad maxima de ese producto
	Leer cant_prod
	Si cant_prod<= lista_cant[pos] Entonces
		lista_cant[pos]<- lista_cant[pos] - cant_prod //Actualizamos el stock disponibl, luego de solicitar x cantidad del producto
		Escribir "Se han pedido ", cant_prod, ", queda disponible en stock un total de ", lista_cant[pos]
	SiNo
		Escribir "La cantidad solicitada, supera la disponible!!"
	Fin Si
FinFuncion

Funcion reponer_producto( cantidad, producto, cant_prod)
	//Función que una vez solicitado al proveedor reponer x cantdiad, actualiza el stock disponible
	pos=buscar_producto(cantidad, producto)
	Escribir "Ingrese la cantidad del producto ",producto[pos], ": "
	Leer cant
	//Actualizamos el producto con el stock actual y el nuevo pedido
	cant_prod[pos]=cant_prod[pos]+cant
Fin Funcion

Funcion  listar_productos_faltantes (cantidad, producto, cant_prod)
	//Función que se encargara de mostrar al ususarios de la aplicación, aquellos productos con una cantidad en stock menor a 5
	// para informarles que hay que reponer 
	Escribir "======LISTADO DE PRODUCTOS A REPONER======"
	Para i<-1 Hasta cantidad Con Paso 1 Hacer
		Si cant_prod[i] < 5 Entonces
			Escribir "Producto ",producto[i], " tiene una cantidad de ",cant_prod[i], " y necesita reponerse!!"
		Fin Si
	Fin Para
Fin Funcion

Funcion op<- menu()
	Escribir "Seleccione una Opción"
	Escribir "1- Mostrar Listado de los Productos Disponibles "
	Escribir "2- Retirar Productos "
	Escribir "3- Reponer un Producto "
	Escribir "4- Mostrar Productos que necesitan ser repuestos"
	Escribir "0-Salir"
	Leer op
FinFuncion

Algoritmo control_stock
	Dimension lista_prod[5], lista_cant[5]
	Escribir "BIENVENIDOS A LA TIENDA VIRTUAL"
	Escribir "Empecemos cargando los productos disponibles"
	Escribir "Ingrese la cantidad de productos a cargar(máx 5)"
	Leer cant
	crear_lista_productos(cant,lista_prod, lista_cant)
	Borrar Pantalla
	Escribir "Carga de productos Exitosamente"
	Repetir
		opc=menu()
		Escribir opc
		Segun opc Hacer
			1:
				mostrar_productos(cant, lista_prod,lista_cant)
				Escribir "<<Presione una tecla para continuar>>"
				Esperar Tecla
				Borrar Pantalla
			2:
				retirar_productos(cant, lista_prod, lista_cant)
				Escribir "<<Presione una tecla para continuar>>"
				Esperar Tecla
				Borrar Pantalla
			3:
				reponer_producto(cant, lista_prod,lista_cant)
				Escribir "<<Presione una tecla para continuar>>"
				Esperar Tecla
				Borrar Pantalla
			4:
				listar_productos_faltantes(cant, lista_prod, lista_cant)
				Escribir "<<Presione una tecla para continuar>>"
				Esperar Tecla
				Borrar Pantalla
		Fin Segun
	Hasta Que opc==0
FinAlgoritmo
