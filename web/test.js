// myscript.js

var oracledb = require('oracledb');
var response = []
function query(params = null){
    oracledb.getConnection(
        {
          user          : "LSSG_PROY_ADMIN",
          password      : "LSSG_PROY_ADMIN",
          connectString : "localhost/cursodb.fi.unam"
        },
        function(err, connection) {
          if (err) {
            console.error(err.message);
            return;
          }
          connection.execute(params,
            //[1],  // bind value for :id
            function(err, result) {
              if (err) {
                console.error(err.message);
                doRelease(connection);
                return;
              }
              //console.log(result.rows);
              // = result.rows
              doRelease(connection);
              //console.log(result.rows)

              console.log(result.rows.length)
              result.rows.forEach(element => {
                  //console.log(element)
                  response.push(element) ;
              });
              console.log('response',response)
              return response
            });
            return response
        });
      
      function doRelease(connection) {
        connection.close(
          function(err) {
            if (err)
              console.error(err.message);
          });
      }
}


var express = require('express');
var app = express();

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
  });
  app.get('/', function(req, res) {
    res.sendFile(__dirname +'/index.html');
  })
app.post('/api/', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `SELECT *
    FROM articulo a
    WHERE a.articulo_id = 1
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });

  app.post('/api/1', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `SELECT *
    FROM articulo a
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });
  app.post('/api/2', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `
    SELECT NOMBRE, AP_PATERNO, AP_MATERNO, NUM_CEDULA, NUM_CONTRATO
    FROM EMPLEADO E
    LEFT JOIN EDITOR ED
    ON ED.EMPLEADO_ID = E.EMPLEADO_ID
    LEFT JOIN REVISOR R
    ON E.EMPLEADO_ID = R.EMPLEADO_ID
    WHERE AP_PATERNO LIKE '%H%'
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });
  app.post('/api/3', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `
    SELECT Q1.ARTICULO_ID, MAX(Q1.PROM)
FROM  (
  SELECT ARTICULO_ID, AVG(CALIFICACION) PROM
  FROM ARTICULO_REVISOR
  GROUP BY ARTICULO_ID
  HAVING AVG(CALIFICACION) > 5
)  Q1
GROUP BY Q1.ARTICULO_ID
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });
  app.post('/api/4', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `SELECT E.NOMBRE, E.AP_PATERNO
    FROM EMPLEADO E
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });
  app.post('/api/5', function(req, res) {
    //res.render('about');
    console.log('body',req.body)

    let sql = `SELECT *
    FROM articulo a
   `
    let r = query(sql);
    setTimeout(()=>{
        console.log('r',r)
        console.log('response express',response)
        res.json(response);
        response = []
    }, 250)
   
  });