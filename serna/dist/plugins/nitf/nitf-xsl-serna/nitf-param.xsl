<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
  <!-- page header and footer -->
  <xsl:param name="page-header-margin">0.5in</xsl:param>
  <xsl:param name="page-footer-margin">0.5in</xsl:param>
  <xsl:param name="title-print-in-header">true</xsl:param>
  <xsl:param name="page-number-print-in-footer">true</xsl:param>
  
  <!-- multi column -->
  <xsl:param name="column-count">1</xsl:param>
  <xsl:param name="column-gap">12pt</xsl:param>
  
  <!-- writing-mode: lr-tb | rl-tb | tb-rl -->
  <xsl:param name="writing-mode">lr-tb</xsl:param>
  
  <!-- hyphenate: true | false -->
  <xsl:param name="hyphenate">false</xsl:param>

  <!-- Page setup -->

  <xsl:param name="paper.type" select="'A4'"/>
  <xsl:param name="page.orientation" select="'portrait'"/>
  <xsl:variable name="default.indent.shift" select="'20'"/>

  <xsl:param name="body.margin.bottom">24pt</xsl:param>
  <xsl:param name="body.margin.top">24pt</xsl:param>
  <xsl:param name="page.margin.top">1in</xsl:param>
  <xsl:param name="page.margin.bottom">1in</xsl:param>
  <xsl:param name="page.margin.left">1in</xsl:param>
  <xsl:param name="page.margin.right">1in</xsl:param>

  <xsl:param name="body.font.size" select="concat($body.font.master,'pt')"/>
  <xsl:param name="tiny.font.size" select="concat(0.66 * $body.font.master,'pt')"/>
  <xsl:param name="small.font.size" select="concat(0.83 * $body.font.master,'pt')"/>
  <xsl:param name="large.font.size" select="concat(1.33 * $body.font.master,'pt')"/>
  <xsl:param name="huge.font.size" select="concat(2 * $body.font.master,'pt')"/>

  <xsl:param name="text-align">start</xsl:param>

  <xsl:attribute-set name="root">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$body.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-size"><xsl:value-of select="$body.font.size"/></xsl:attribute>
    <xsl:attribute name="text-align"><xsl:value-of select="$text-align"/></xsl:attribute>
  </xsl:attribute-set>
   
  <xsl:attribute-set name="body">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="page-header">
    <xsl:attribute name="font-size">small</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="page-footer">
    <xsl:attribute name="font-size">small</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="h1">
    <xsl:attribute name="font-size"><xsl:value-of select="$huge.font.size"/></xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">0.67em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="h2">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(1.5 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">0.83em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="h3">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(1.17 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">1em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="h4">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat($body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">1.17em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1.17em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="h5">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(0.83 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">1.33em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1.33em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="h6">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(0.67 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="padding-top">1.67em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1.67em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="p">
    <xsl:attribute name="padding-top">1em</xsl:attribute>
  </xsl:attribute-set>

  <xsl:attribute-set name="byline">
    <xsl:attribute name="padding-top">0.5pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="p-initial" use-attribute-sets="p">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="p-initial-first" use-attribute-sets="p-initial">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="blockquote">
    <xsl:attribute name="start-indent">inherited-property-value(start-indent) + 24pt</xsl:attribute>
    <xsl:attribute name="end-indent">inherited-property-value(end-indent) + 24pt</xsl:attribute>
    <xsl:attribute name="padding-top">1em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="pre">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(0.83 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="white-space">pre</xsl:attribute>
    <xsl:attribute name="padding-top">1em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1em</xsl:attribute>
    <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="address">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="hr">
    <xsl:attribute name="border">1px inset</xsl:attribute>
    <xsl:attribute name="padding-top">0.67em</xsl:attribute>
    <xsl:attribute name="padding-bottom">0.67em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ul">
    <xsl:attribute name="padding-top">1em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ul-nested">
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ol">
    <xsl:attribute name="padding-top">1em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ol-nested">
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ul-li">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="ol-li">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="dl">
    <xsl:attribute name="padding-top">1em</xsl:attribute>
    <xsl:attribute name="padding-bottom">1em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="dt">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="dd">
    <xsl:attribute name="start-indent">inherited-property-value(start-indent) + 24pt</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="ul-label-1">&#x2022;</xsl:param>
  <xsl:attribute-set name="ul-label-1">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$serif.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat($body.font.master,'pt')"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="ul-label-2">o</xsl:param>
  <xsl:attribute-set name="ul-label-2">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(0.67 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="baseline-shift">0.25em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="ul-label-3">-</xsl:param>
  <xsl:attribute-set name="ul-label-3">
    <xsl:attribute name="font-size">
      <xsl:value-of select="concat(0.9 * $body.font.master,'pt')"/>
    </xsl:attribute>
    <xsl:attribute name="font-family">
      <xsl:value-of select="$sans.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="baseline-shift">0.05em</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:param name="ol-label-1">1.</xsl:param>
  <xsl:attribute-set name="ol-label-1"/>
  
  <xsl:param name="ol-label-2">a.</xsl:param>
  <xsl:attribute-set name="ol-label-2"/>
  
  <xsl:param name="ol-label-3">i.</xsl:param>
  <xsl:attribute-set name="ol-label-3"/>
  
  <xsl:attribute-set name="b">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="strong">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="strong-em">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="i">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="cite">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="em">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="var">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="dfn">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="tt">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="code">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="kbd">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="samp">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$monospace.font.family"/>
    </xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="big">
    <xsl:attribute name="font-size">larger</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="small">
    <xsl:attribute name="font-size">small</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="sub">
    <xsl:attribute name="baseline-shift">sub</xsl:attribute>
    <xsl:attribute name="font-size">small</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="sup">
    <xsl:attribute name="baseline-shift">super</xsl:attribute>
    <xsl:attribute name="font-size">small</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="s">
    <xsl:attribute name="text-decoration">line-through</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="strike">
    <xsl:attribute name="text-decoration">line-through</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="del">
    <xsl:attribute name="text-decoration">line-through</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="u">
    <xsl:attribute name="text-decoration">underline</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="ins">
    <xsl:attribute name="text-decoration">underline</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="abbr">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="acronym">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="q"/>
  <xsl:attribute-set name="q-nested"/>
  
  <xsl:attribute-set name="img">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="img-link">
    <xsl:attribute name="border">2px</xsl:attribute>
    <xsl:attribute name="border-color">#000000</xsl:attribute>
  </xsl:attribute-set>
   
  <xsl:attribute-set name="a-link">
    <xsl:attribute name="text-decoration">underline</xsl:attribute>
    <xsl:attribute name="color">blue</xsl:attribute>
  </xsl:attribute-set>

  <!-- Table parameters -->

  <xsl:attribute-set name="xhtml-inside-table">
    <xsl:attribute name="start-indent">0pt</xsl:attribute>
    <xsl:attribute name="end-indent">0pt</xsl:attribute>
    <xsl:attribute name="text-indent">0pt</xsl:attribute>
    <xsl:attribute name="last-line-end-indent">0pt</xsl:attribute>
    <xsl:attribute name="text-align">start</xsl:attribute>
    <xsl:attribute name="text-align-last">relative</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-table-and-caption" >
    <xsl:attribute name="display-align">center</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-table">
    <xsl:attribute name="border-collapse">separate</xsl:attribute>
    <xsl:attribute name="border-spacing">2px</xsl:attribute>
    <xsl:attribute name="border-width">1px</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-table-caption" use-attribute-sets="xhtml-inside-table">
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-table-column">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-thead" use-attribute-sets="xhtml-inside-table">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-tfoot" use-attribute-sets="xhtml-inside-table">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-tbody" use-attribute-sets="xhtml-inside-table">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-tr">
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-th">
    <xsl:attribute name="font-weight">bolder</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="border-width">1px</xsl:attribute>
    <xsl:attribute name="padding">1px</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name="xhtml-td">
    <xsl:attribute name="border-width">1px</xsl:attribute>
    <xsl:attribute name="padding">1px</xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>
