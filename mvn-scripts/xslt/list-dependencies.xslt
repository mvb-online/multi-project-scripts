<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:pom="http://maven.apache.org/POM/4.0.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/pom:project">
        <xsl:call-template name="printUpdate"/>

        <xsl:for-each select="pom:properties/*[ends-with(name(), '.version')]">
            <xsl:value-of select="name()" />
            <xsl:text>:</xsl:text>                        
            <xsl:value-of select ="./text()"/>
            <xsl:text>&#10;</xsl:text>            
        </xsl:for-each>    

        <xsl:for-each select="pom:dependencies/pom:dependency[starts-with(pom:groupId, 'de.mvbonline')]">
            <xsl:value-of select="pom:groupId"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="pom:artifactId"/>
            <xsl:text>:</xsl:text>
            <xsl:choose>
                <xsl:when test="pom:version = '${project.parent.version}'">
                    <xsl:apply-templates select="/pom:project/pom:parent/pom:version" mode="copy-coordinate"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="pom:version" mode="copy-coordinate"/>
                </xsl:otherwise>    
            </xsl:choose>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>    
    </xsl:template>

    <xsl:template match="*" mode="copy-coordinate">

        <!-- write coordinate as XML element without namespace declarations -->
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template name="printUpdate">
        <xsl:choose>
            <xsl:when test="pom:groupId != ''">
                <xsl:apply-templates select="pom:groupId" mode="copy-coordinate"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="pom:parent/pom:groupId" mode="copy-coordinate"/>
            </xsl:otherwise>    
        </xsl:choose>

        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:artifactId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:choose>
            <xsl:when test="pom:version != ''">
                <xsl:apply-templates select="pom:version" mode="copy-coordinate"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="pom:parent/pom:version" mode="copy-coordinate"/>
            </xsl:otherwise>    
        </xsl:choose>

        <xsl:text>&#10;</xsl:text>
    </xsl:template>    

</xsl:stylesheet>