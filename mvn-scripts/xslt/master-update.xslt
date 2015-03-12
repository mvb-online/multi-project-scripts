<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:pom="http://maven.apache.org/POM/4.0.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/pom:project">
        <xsl:choose>
            <xsl:when test="pom:parent/pom:artifactId = 'master'">
                <xsl:if test="(pom:parent/pom:version != '10.0.15') and (pom:parent/pom:version != '10.0.16-SNAPSHOT')">
                    <xsl:call-template name="printUpdate"/>
                </xsl:if>        
            </xsl:when>
            <xsl:when test="pom:parent/pom:artifactId = 'group-pom'">
                <xsl:choose>
                    <xsl:when test="pom:parent/pom:groupId = 'de.mvbonline.dds'">
                        <xsl:if test="(pom:parent/pom:version != '1.0.6') and (pom:parent/pom:version != '1.0.7-SNAPSHOT')">
                            <xsl:call-template name="printUpdate"/>
                        </xsl:if>        
                    </xsl:when>
                    <xsl:when test="pom:parent/pom:groupId = 'de.mvbonline.vlx'">
                        <xsl:if test="(pom:parent/pom:version != '0.0.18') and (pom:parent/pom:version != '0.0.19-SNAPSHOT')">
                            <xsl:call-template name="printUpdate"/>
                        </xsl:if>        
                    </xsl:when>                        
                    <xsl:otherwise>
                        <xsl:text>No valid group-pom found -  (</xsl:text>
                        <xsl:apply-templates select="pom:artifactId" mode="copy-coordinate"/>
                        <xsl:text>)&#10;&#10;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="pom:parent/pom:artifactId = 'apps-group-pom'">
                <xsl:if test="(pom:parent/pom:version != '0.0.5') and (pom:parent/pom:version != '0.0.6-SNAPSHOT')">
                    <xsl:call-template name="printUpdate"/>
                </xsl:if>        
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>No valid parent pom found - (</xsl:text>
                <xsl:apply-templates select="pom:artifactId" mode="copy-coordinate"/>
                <xsl:text>)&#10;&#10;</xsl:text>
            </xsl:otherwise>    
        </xsl:choose>
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
        <xsl:apply-templates select="pom:version" mode="copy-coordinate"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>UPDATE REQUIRED:</xsl:text>
        <xsl:apply-templates select="pom:parent/pom:groupId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:parent/pom:artifactId" mode="copy-coordinate"/>
        <xsl:text>:</xsl:text>
        <xsl:apply-templates select="pom:parent/pom:version" mode="copy-coordinate"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>        
    </xsl:template>    

</xsl:stylesheet>