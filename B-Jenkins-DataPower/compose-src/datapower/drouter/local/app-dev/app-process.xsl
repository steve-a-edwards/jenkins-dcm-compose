<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dp="http://www.datapower.com/extensions"
	extension-element-prefixes="dp"
	exclude-result-prefixes="dp">
	

	<xsl:template match="/">
		
		<xsl:variable name="URI" select="dp:variable('var://service/URI')"/>
		<xsl:variable name="input-size" select="dp:variable('var://service/input-size')"/>

		<response>
			<URI><xsl:value-of select="$URI"/></URI>
			<input-size><xsl:value-of select="$input-size"/></input-size>
		</response>
		
	</xsl:template>


</xsl:stylesheet>
