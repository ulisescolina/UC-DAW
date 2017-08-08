<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Operacion exitosa</title>
    <!-- Le styles -->
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        div{
          background-color: #808080;
          color: white;
          margin: 0 auto;
          padding: 20px;
          text-align:left;
          width: 60%;
        }

        .justificado{
          text-align: justify;
        }

        .izquierda{
          text-align: left;
        }

        .centrado{
          text-align: center;
        }

        .titulo{
          color: #00ff00;
          background-color: #f5f5f5;
          width: 100%;
        }
    </style>
  </head>
  <body>
    <div>
      <div class="centrado titulo"><h1>Usuario registrado exitosamente!</h1></div><br><br>

      Notese el cambio de la url. Fuimos redirigidos hacia otro documento php
      dentro del servidor.<br><br>

      Los datos que nos pasaron mediante el metodo GET fueron estos:<br><br>
      <?php
        $nUsuario = $_GET['nombreUsuario'];
        $nClave = $_GET['clave'];
      ?>
      <div>
        <table class="izquierda">
          <tbody >
            <tr>
              <th>Dato</th>
              <th>Descripcion</th>
            </tr>
            <tr>
              <td>Usuario</td>
              <td><?php echo $nUsuario; ?></td>
            </tr>
            <tr>
              <td>Clave</td>
              <td><?php echo $nClave; ?></td>
            </tr>
          </tbody>
        </table>
      </div>

    </div>
  </body>
</html>
