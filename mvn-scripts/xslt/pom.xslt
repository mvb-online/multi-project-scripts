<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:pom="http://maven.apache.org/POM/4.0.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/pom:project">

        <xsl:apply-templates select="pom:groupId|pom:parent/pom:groupId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:artifactId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:version" mode="copy-coordinate"/>
        <xsl:text>&#10;</xsl:text>

        <xsl:apply-templates select="pom:parent/pom:groupId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:parent/pom:artifactId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:parent/pom:version" mode="copy-coordinate"/>

        <xsl:if test="pom:parent/pom:artifactId = 'master'">
            <xsl:if test="(pom:parent/pom:version != '10.0.15') and (pom:parent/pom:version != '10.0.16-SNAPSHOT')">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>MASTER-UPDATE REQUIRED</xsl:text>
            </xsl:if>    
        </xsl:if>    
        <xsl:text>&#10;</xsl:text>

        <xsl:for-each select="pom:dependencies/pom:dependency[starts-with(pom:groupId, 'de.mvbonline')]">
            <xsl:value-of select="pom:groupId"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="pom:artifactId"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="pom:version"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>    

    </xsl:template>

    <xsl:template match="*" mode="copy-coordinate">
        <!-- write coordinate as XML element without namespace declarations -->
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>