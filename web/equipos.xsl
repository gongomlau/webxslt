<?xml version="1.0" encoding='utf-8'?>
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
		
		<main>
			<!-- Seleccionamos equipo -->
			<xsl:apply-templates select="equipo"></xsl:apply-templates>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

	<!-- Plantilla para los datos de un equipo -->
	<xsl:template match="equipo">
		<!-- Creamos variable para el nombre del entrenador -->
		<xsl:variable name="mister" select="entrenador/nombre"/>
		<xsl:choose>
			<xsl:when test="$mister='Julio Velasco'">
				<h1><a href="{entrenador/url}"><xsl:value-of select="$mister" /></a></h1>
				<article class="equipos">
					<h4><xsl:value-of select="nombre"/></h4>
					<p><xsl:apply-templates select="jugadores/jugador[@titular='si']"></xsl:apply-templates></p>
				</article> 	
			</xsl:when>
			<xsl:otherwise />
		</xsl:choose>
 	</xsl:template>

	<!-- Plantilla para los datos de los jugadores -->
		<xsl:template match="jugador">
			<p><xsl:value-of select="@camiseta" /> - <xsl:value-of select="nombre" /></p>
 		</xsl:template>

</xsl:stylesheet>