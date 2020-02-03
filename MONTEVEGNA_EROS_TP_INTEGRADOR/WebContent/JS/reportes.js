function graficoAprobados(informeCursosProfesorAnio){
    
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------
    
    var aprobadosData=[];
    var desaprobadosData=[];
    var materias=[];
    

    informeCursosProfesorAnio.forEach(function (elem,indx ){
    	aprobadosData.push(elem.cantAlumnosAprobados);
    	desaprobadosData.push(elem.cantAlumnosDesaprobados);
    	materias.push(elem.materia);
    });

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#barChartAprobados').get(0).getContext('2d')

    var areaChartData = {
      labels  : materias,
      datasets: [
        {
          label               : 'Aprobados',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : aprobadosData
        },
        {
          label               : 'Desaprobados',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : desaprobadosData
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
          }
        }]
      }
    }

    // This will get the first returned node in the jQuery collection.
    var areaChart       = new Chart(areaChartCanvas, { 
      type: 'line',
      data: areaChartData, 
      options: areaChartOptions
    })
    //-------------
    //- BAR CHART -
    //-------------
    var barChartAprobadosCanvas = $('#barChartAprobados').get(0).getContext('2d')
    var barChartAprobadosData = jQuery.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    var temp1 = areaChartData.datasets[1]
    barChartAprobadosData.datasets[0] = temp1
    barChartAprobadosData.datasets[1] = temp0

    var barChartAprobadosOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChartAprobados = new Chart(barChartAprobadosCanvas, {
      type: 'bar', 
      data: barChartAprobadosData,
      options: barChartAprobadosOptions
    })
    
    } 

function graficoCursos(informeCantidadCursosProfesor){
    
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------
    
    var cantCursosData=[];
    var profesores=[];
    

    informeCantidadCursosProfesor.forEach(function (elem,indx ){
    	cantCursosData.push(elem.cantCursos);
    	profesores.push(elem.profesor);
    });

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#barChartCursos').get(0).getContext('2d')

    var areaChartData = {
      labels  : profesores,
      datasets: [
        {
          label               : 'Cantidad de Cursos',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : cantCursosData
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
        	//para que la escala arranque en 0
            ticks: {
                beginAtZero: true,
                min: 0
            },
          gridLines : {
            display : true,
          }
        }]
      }
    }

    // This will get the first returned node in the jQuery collection.
    var areaChart       = new Chart(areaChartCanvas, { 
      type: 'bar',
      data: areaChartData, 
      options: areaChartOptions
    })
    //-------------
    //- BAR CHART -
    //-------------
    var barChartCursosCanvas = $('#barChartCursos').get(0).getContext('2d')
    var barChartCursosData = jQuery.extend(true, {}, areaChartData)
//    var temp0 = areaChartData.datasets[0]
//    barChartCursosData.datasets[0] = temp1


    var barChartCursosOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChartCursos = new Chart(barChartCursosCanvas, {
      type: 'bar', 
//      data: barChartCursosData,
//      options: barChartCursosOptions
    data: areaChartData,
    options: areaChartOptions
    })
    
    } 
