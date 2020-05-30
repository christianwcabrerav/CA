<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Cliente</title>
</head>
<body>

<div class="container">
<h1>Registra Cliente</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraCliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nomcliente" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ape">Apellido</label>
				<input class="form-control" id="id_ape" name="apecliente" placeholder="Ingrese el apellido" type="text" maxlength="40"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" id="id_dni" name="dnicliente" placeholder="Ingrese el n�mero de DNI" type="text" maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fecnac">Fecha Nacimiento</label>
				<input class="form-control" id="id_fecnac" name="fecnacCliente" placeholder="YYYY/MM/DD" type="text"/>
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_tipo">Tipo</label>
				<select id="id_tipo" name="tipo.codtipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Cliente</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaTipo", {}, function(data){
	console.log("inicio3");
	$.each(data, function(index,item){
		$("#id_tipo").append("<option value="+item.codtipo +">"+ item.nomtipo +"</option>");
	
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 4 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        apecliente: {
    		selector : '#id_ape',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El apellido es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
	           
            }
        },
        dnicliente: {
    		selector : '#id_dni',
    	    validators:{
                notEmpty: {
                     message: 'El dni es obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{8}$/,
                    message: 'el dni es 8 d�gitos'
                }
            }
        },
        fecnacCliente: {
    		selector : '#id_fecnac',
            validators: {
            	notEmpty: {
                    message: 'La fecha de nacimiento es un campo obligatorio'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'The value is not a valid date'
	            }
            }
        },
        
        
        tipo: {
    		selector : '#id_tipo',
            validators: {
            	notEmpty: {
                    message: 'El tipo es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




