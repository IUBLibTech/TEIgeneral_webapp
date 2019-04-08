<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el"%>
<%@ taglib uri="/WEB-INF/struts-layout.tld" prefix="layout" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="ctld"%>
<%@ taglib uri="/WEB-INF/x.tld" prefix="x"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<tiles:useAttribute id="pageTitle" name="title" 
	classname="java.lang.String" ignore="true"/>

<ctld:choose>
	<ctld:when test="${!empty param.brand}">
		<ctld:import var="list" url="/browse/repository.xml" charEncoding="utf-8"/>
		<ctld:import var="repositoryXSL" url="/WEB-INF/layouts/repository.xsl" />
		<ctld:set var="brandName">
		<x:transform xml="${list}" xslt="${repositoryXSL}">
			<x:param name="repository" value="${param.brand}" />	
		</x:transform> 
		</ctld:set>
	</ctld:when>
	<ctld:otherwise>
		<ctld:set var="brandName" value="Default Brand"/>
	</ctld:otherwise>
</ctld:choose>

<ctld:if test="${empty brandName}">
	<ctld:set var="brandName" value="Default Brand"/>
</ctld:if>

<title>
	<ctld:out value="${brandName}"/> - 
	<c:out value="${pageTitle}"/>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width = 320" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" />

<%-- Get Javascript List --%>
<tiles:useAttribute id="scriptList" name="scripts" 
    classname="java.util.List" ignore="true"/>

<c:forEach var="js" items="${scriptList}">
    <script type="text/javascript"
        src="<html-el:rewrite page="${js}"/>"></script>
</c:forEach>

<tiles:useAttribute id="timelineScriptList" name="timelineScripts" classname="java.util.List" ignore="true"/>

<c:forEach var="timelineJS" items="${timelineScriptList}">
	<script type="text/javascript" src="${timelineJS}"></script>
</c:forEach>

<tiles:useAttribute id="browseScriptList" name="browseScripts" classname="java.util.List" ignore="true"/>

<c:forEach var="browseJS" items="${browseScriptList}">
	<script type="text/javascript" src="<html-el:rewrite page="${browseJS}"/>"></script>
</c:forEach>

<!-- Javascript file for AddThis button -->
<!-- <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?pub=diglib"></script> -->

<%-- Get List of Stylesheets --%>
<tiles:useAttribute id="styleList" name="styles" 
    classname="java.util.List" ignore="true"/>

<ctld:choose>
<ctld:when test="${ (!empty param.brand) && (brandName != 'Default Brand') }">
      <link type="text/css" rel="stylesheet" media="all" href="<html-el:rewrite page="/css/${param.brand}.css"/>" />
</ctld:when>
<ctld:otherwise>
	<link type="text/css" rel="stylesheet" media="all" href="<html-el:rewrite page="/css/tei-general.css"/>" />
</ctld:otherwise>
</ctld:choose>

<ctld:if test="${empty param.brand}">
	<c:forEach var="css" items="${styleList}">
	    <link rel="stylesheet" type="text/css" media="all" 
	        href="<html-el:rewrite page="${css}"/>" /> 
	</c:forEach>
</ctld:if>

<link rel="stylesheet" media="print" href="<html-el:rewrite page="/css/print.css"/>" />
<ctld:choose>
<ctld:when test="${!empty param.brand}">
<link type="text/css" rel="stylesheet" media="only screen and (max-device-width: 480px)" href="<html-el:rewrite page="/css/small_device_${param.brand}.css"/>" />
</ctld:when>
<ctld:otherwise>
<link type="text/css" rel="stylesheet" media="only screen and (max-device-width: 480px)" href="<html-el:rewrite page="/css/small_device.css"/>" />
</ctld:otherwise>
</ctld:choose>


</head>
<tiles:useAttribute id="onloadScript" name="onload" classname="java.lang.String" ignore="true"/>
<body onload="<c:out value="${onloadScript}"/>">


<div id="skipnav">
	<a href="#skipnavLink">Skip to Content</a>
</div>
<%-- <header> --%>
        <tiles:insert attribute="banner"/>
    <div id="site_container">
        <tiles:insert attribute="siteNavigation"/>
<%-- </header> --%>
<tiles:insert attribute="body"/>
<%-- <footer> --%>
<tiles:insert attribute="footer"/>
<%-- </footer> --%>
</div>  
</body>

</html>
