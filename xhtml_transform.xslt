<?xml version="1.0" encoding="ISO-8859-2"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
  <xsl:template match="/">
  
      			
	<html>
      				
  
  <head>
  <title>Chosen movies and series</title>
   <style  type="text/css">
                    table {
					font-family: Verdana;
                    border-collapse: collapse;
					background-color: AliceBlue;
					text-align: center;
					padding: 15px;
                    }

                    table, th, td {
					font-family: Verdana;
                    border: 1px solid MediumVioletRed;
					text-align: center;
					padding: 10px;
                    }
					h1{
					font-family: Verdana;
					color: MediumVioletRed;
					text-decoration: overline; 
					font-size: 20pt;
					text-align: left;
					margin-left: 2%;
					}
					h2{
					font-family: Verdana;
					color: MediumVioletRed;
					font-size: 10pt;
					text-align: left;
					margin-left: 2%;
					}
				
		</style>
  </head>
  <body>
  <h2><xsl:value-of select="watchingLibraryReport/author"/></h2>
	<h3><img src="C:\Users\Tsukineko\Desktop\cat.png" alt="Movie Clapper-Board" align="right" /></h3>

 <xsl:apply-templates select="watchingLibraryReport"/>

   <xsl:apply-templates select="watchingLibraryReport//summary"/>

   
  </body>
  </html>
</xsl:template>

<xsl:template match="watchingLibraryReport">
	<table align="center">
    <tr bgcolor="#FFF0F5">
	  <th>Type</th>
      <th>Title</th>
      <th>Creator</th>
	  <th>Rate</th>
	  <th>Country</th>
	  <th>Genre</th>
	  <th>Release Date</th>
    </tr>
    <xsl:for-each select="item">
    
	   <xsl:sort select="@type" />
	   <xsl:sort select="@rate" order="descending" />
    
	<tr>
		<td ><xsl:value-of select="@type"/></td>
        <td ><xsl:value-of select="."/></td>
        <td><xsl:value-of select="@creator"/></td>
		<td><xsl:value-of select="@rate"/></td>
		<td><xsl:value-of select="@country"/></td>
		<td><xsl:value-of select="@genre"/></td>
		<td><xsl:value-of select="@releaseDate"/></td>
	</tr>
    </xsl:for-each>
  </table>
</xsl:template>
<xsl:template match="watchingLibraryReport//summary">
<table>
                    <caption><b>Summary</b></caption>
                    <tr bgcolor="#FFF0F5" >
                        <th>Items count</th>
                        <th>USA movies count</th>
                        <th>Sci-Fi series count</th>
                        <th>Items for age under 15 count</th>
                        <th>Average movies rate</th>
                        <th>Average series rate</th>
                        <th>Creation date</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="//itemsCount"/></td>
                        <td><xsl:value-of select="//USAmoviesCount"/></td>
                        <td><xsl:value-of select="//Sci-FiseriesCount"/></td>
                        <td><xsl:value-of select="//itemsForUnder15Count"/></td>
                        <td><xsl:value-of select="//averageMoviesRate"/></td>
                        <td><xsl:value-of select="//averageSeriesRate"/></td>
                        <td><xsl:value-of select="//date"/></td>
					</tr>
</table>
</xsl:template>
</xsl:stylesheet>






