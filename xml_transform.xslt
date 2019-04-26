<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

	<xsl:template match="/">
		<xsl:element name="watchingLibraryReport">
			<xsl:apply-templates select="watchingLibrary/authors" />
			<xsl:apply-templates select="watchingLibrary/list" />
                        <xsl:apply-templates select="watchingLibrary/footer" />
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="watchingLibrary/authors">
			<xsl:element name="author">
				<xsl:value-of select="concat('Autorzy: ', author[1], ' i ', author[2])" />
			</xsl:element>
	</xsl:template>

	<xsl:template match="watchingLibrary/list">
		<xsl:for-each select="item">
			<xsl:sort select="rate" order="descending" />
			<xsl:element name="item">
                            <xsl:attribute name="no">
                                <xsl:value-of select="position()" />
                            </xsl:attribute>
				<xsl:attribute name="rate" >
					<xsl:value-of select="rate" />
				</xsl:attribute>
                                <xsl:attribute name="country">
                                    <xsl:choose>
					<xsl:when test="string(@c_idref) = 'c01'">
                                            <xsl:value-of select="//countries/country[1]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c02'">
                                            <xsl:value-of select="//countries/country[2]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c03'">
                                            <xsl:value-of select="//countries/country[3]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c04'">
                                            <xsl:value-of select="//countries/country[4]" />   
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c05'">  
                                            <xsl:value-of select="//countries/country[5]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c06'">
                                            <xsl:value-of select="//countries/country[6]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c07'">
                                            <xsl:value-of select="//countries/country[7]" />
					</xsl:when>
					<xsl:when test="string(@c_idref) = 'c08'">
                                            <xsl:value-of select="//countries/country[8]" />
					</xsl:when>
					<xsl:otherwise>
                                                <xsl:value-of select="string('other')" />
					</xsl:otherwise>
                                    </xsl:choose>
				</xsl:attribute>
                                <xsl:attribute name="genre">
                                    <xsl:choose>
					<xsl:when test="string(@genre_idref) = 'g01'">
                                            <xsl:value-of select="//genres/genre[1]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g02'">
                                            <xsl:value-of select="//genres/genre[2]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g03'">
                                            <xsl:value-of select="//genres/genre[3]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g04'">
                                            <xsl:value-of select="//genres/genre[4]" />   
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g05'">
                                            <xsl:value-of select="//genres/genre[5]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g06'">
                                            <xsl:value-of select="//genres/genre[6]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g07'">
                                            <xsl:value-of select="//genres/genre[7]" />
					</xsl:when>
					<xsl:when test="string(@genre_idref) = 'g08'">
                                            <xsl:value-of select="//genres/genre[8]" />
					</xsl:when>
                                        <xsl:when test="string(@genre_idref) = 'g09'">
                                            <xsl:value-of select="//genres/genre[9]" />
                                        </xsl:when>
                                        <xsl:when test="string(@genre_idref) = 'g10'">
                                            <xsl:value-of select="//genres/genre[10]" />
					</xsl:when>
					<xsl:otherwise>
                                            <xsl:value-of select="string('other')" />
					</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                               
				<xsl:value-of select="concat(' Tytuł: ','&quot;', title, '&quot;')" />
				<xsl:value-of select="concat(', reżyseria: ', creator)" />

				<xsl:choose>
					<xsl:when test="string(@type_id) = 'movie'">
						<xsl:value-of select="concat(', data wydania: ', release)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(', data wydania: ', year)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

        <xsl:template match="watchingLibrary/footer">
            <xsl:element name="summary" >
                <xsl:element name="itemsCount">
                    <xsl:value-of select="count(//list/item)" />
                </xsl:element>
                <xsl:element name="USAmoviesCount">
                    <xsl:value-of select="count(//list/item[@type_id = 'movie'][@c_idref = 'c04'])" />
                </xsl:element>
                <xsl:element name="Sci-FiseriesCount">
                    <xsl:value-of select="count(//list/item[@type_id = 'series'][@genre_idref = 'g06'])" />
                </xsl:element>
                <xsl:element name="itemsForUnder15Count">
                    <xsl:value-of select="count(//list/item[ageLimit &lt; 15])" />
                </xsl:element>
                <xsl:element name="averageMoviesRate">
                    <xsl:value-of select="sum(//list/item[@type_id = 'movie']/rate) div count(//list/item[@type_id = 'movie'])" />
                </xsl:element>
                <xsl:element name="averageSeriesRate">
                    <xsl:value-of select="sum(//list/item[@type_id = 'series']/rate) div count(//list/item[@type_id = 'series'])" />
                </xsl:element>
                <xsl:element name="date">
                    <xsl:value-of select="." />
                </xsl:element>
            </xsl:element>
        </xsl:template>
</xsl:stylesheet>