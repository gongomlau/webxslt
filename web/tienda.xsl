<?xml version="1.0" encoding='utf-8'?>
<!--
Autor: Laura González
Asignatura: LMSGI
Unidad: UD 4
Tarea: Tarea evaluativa 2 - XSLT
Autoevaluación: https://drive.google.com/file/d/1PhgaH9uQj7J_G8jyk85QtIhDQKg1Y-mD/view?usp=drive_link
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main class="principal">
			<!-- Seleccionamos los articulos de la tienda -->
      <xsl:for-each select="/club_voleibol/tienda/articulo">
        <article>
          <section>
						<!-- Usamos las {} para combinar codigo HTML y XSLT y cargar la imagen-->
            <img class="articulo" src="../img/{@foto}"/>			
          </section>
          <section>
            <h2><xsl:value-of select='precio'/> €</h2>
            <!-- Calculamos el número de comentarios y lo mostramos -->
            <h3>Comentarios: <xsl:value-of select='count(comentarios)'/></h3>
            <ul>
              <!-- Seleccionamos y mostramos cada comentario -->
              <xsl:for-each select="comentarios">
                <li><xsl:value-of select='.' /></li>
              </xsl:for-each>
            </ul>
          </section>
        </article>
      </xsl:for-each>	
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>