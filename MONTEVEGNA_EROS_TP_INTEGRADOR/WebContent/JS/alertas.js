
function errorAlert(titulo,texto)
{
	Swal.fire({
		  icon: 'error',
		  title: titulo,
		  text: texto
		//  footer: '<a href>Why do I have this issue?</a>'
		})
}

function sweetAlert(titulo,subTitle,type)
{
	Swal.fire({
			title: titulo,
			text:  subTitle,
			icon: type			
			})
}

