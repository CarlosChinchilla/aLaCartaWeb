
/*----------ANIMACION MENU MOVIL------------------*/
var visible = false;

function menu(){
	
	var menuM = document.getElementById("menuM");
	
	if(!visible){
		menuM.style.display = 'block';
		
		visible = true;
	}else{
		menuM.style.display = 'none';
		visible = false;
	}
}

/*-------------------VALIDACIONES------------------ */
function validacion(){
	
	var todoOk = true;
	
	var formulario = document.getElementsByTagName("formRest");
	
	var datos = formRest.getElementsByTagName("input");
	
	var selects = formRest.getElementsByTagName("select");
	
	
	if (selects[0].value == ""){

        todoOk = false;

        selects[0].style.background = "#FDD4D4";

    }else{

        selects[0].style.background = "#ffffff";

    }

	if (selects[1].value == ""){

        todoOk = false;

        selects[1].style.background = "#FDD4D4";

    }else{

        selects[1].style.background = "#ffffff";

    }
	
	if (datos[1].value == ""){

        todoOk = false;

        datos[1].style.background = "#FDD4D4";

    }else{

        datos[1].style.background = "#ffffff";

    }

	if (datos[2].value == ""){

        todoOk = false;

        datos[2].style.background = "#FDD4D4";

    }else{

        datos[2].style.background = "#ffffff";

    }

	if (isNaN(datos[3].value) || datos[3].value.length != 5){

        todoOk = false;

        datos[3].style.background = "#FDD4D4";

    }else{

        datos[3].style.background = "#ffffff";

    }

	if (isNaN(datos[4].value) || datos[4].value.length != 9){

        todoOk = false;

        datos[4].style.background = "#FDD4D4";

    }else{

        datos[4].style.background = "#ffffff";

    }
	
	if(todoOk){
		
		document.getElementById('formRest').submit();
		
	}else{
		alert("Existen campos con datos erroneos");
	}

    //alert("Todo OK");
}

function validacionEditar(){
	
	var todoOk = true;
	
	var formulario = document.getElementsByTagName("formRestEd");
	
	var datos = formRestEd.getElementsByTagName("input");
	
	var selects = formRestEd.getElementsByTagName("select");
	
	
	if (selects[0].value == ""){

        todoOk = false;

        selects[0].style.background = "#FDD4D4";

    }else{

        selects[0].style.background = "#ffffff";

    }

	if (selects[1].value == ""){

        todoOk = false;

        selects[1].style.background = "#FDD4D4";

    }else{

        selects[1].style.background = "#ffffff";

    }
	
	if (datos[1].value == ""){

        todoOk = false;

        datos[1].style.background = "#FDD4D4";

    }else{

        datos[1].style.background = "#ffffff";

    }

	if (datos[2].value == ""){

        todoOk = false;

        datos[2].style.background = "#FDD4D4";

    }else{

        datos[2].style.background = "#ffffff";

    }

	if (isNaN(datos[3].value) || datos[3].value.length != 5){

        todoOk = false;

        datos[3].style.background = "#FDD4D4";

    }else{

        datos[3].style.background = "#ffffff";

    }

	if (isNaN(datos[4].value) || datos[4].value.length != 9){

        todoOk = false;

        datos[4].style.background = "#FDD4D4";

    }else{

        datos[4].style.background = "#ffffff";

    }
	
	if(todoOk){
		
		document.getElementById('formRestEd').submit();
		
	}else{
		alert("Existen campos con datos erroneos");
	}

    //alert("Todo OK");
}

function submitBusqueda(){
	
	var busqueda = document.getElementById('busqueda');
	
	if(busqueda.value != ""){
		document.getElementById('formBuscar').submit();
	}else{
		
	}
	
    //alert("Todo OK");
}

function submitLogin(){
	
	var todoOk = true;
	
	var formulario = document.getElementsByTagName("formLogin");
	
	var datos = formLogin.getElementsByTagName("input");

	if (datos[1].value != "" && datos[2].value != ""){

        document.getElementById('formLogin').submit();

    }else{
	
	}

    //alert("Todo OK");
}

function submitRegistro(){
	
	var todoOk = true;
	
	var formulario = document.getElementsByTagName("formReg");
	
	var datos = formReg.getElementsByTagName("input");
	
	if(datos[2].value != datos[3].value){
		todoOk = false;
		alert("Las contrasenas no coinciden");
	}

	if (datos[1].value == "" || datos[2].value == "" || datos[3].value == "" || !todoOk){

    }else{
		document.getElementById('formReg').submit();
	}
	
    //alert("Todo OK");
}
