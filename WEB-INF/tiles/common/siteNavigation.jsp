<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/x.tld" prefix="x"%>

<c:choose>
	<c:when test="${!empty param.brand}">
		<c:import var="list" url="/browse/repository.xml" charEncoding="utf-8"/>
		<c:import var="repositoryXSL" url="/WEB-INF/layouts/repository.xsl" />
		<c:set var="brandName">
		<x:transform xml="${list}" xslt="${repositoryXSL}">
			<x:param name="repository" value="${param.brand}" />	
		</x:transform> 
		</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="brandName" value="Default Brand"/>
	</c:otherwise>
</c:choose>

<c:if test="${empty brandName}">
	<c:set var="brandName" value="Default Brand"/>
</c:if>
	
    <ul id="top_nav_links" role="navigation">
      <li><a href="<html-el:rewrite page="/welcome.do?brand=${param.brand}"/>">Home</a></li>
      <li><a href="<html-el:rewrite page="/projectinfo.do?brand=${param.brand}"/>">Project Information</a></li>
      <li><a href="<html-el:rewrite page="/help.do?brand=${param.brand}"/>">Help</a></li>
      <li><a href="<html-el:rewrite page="/search?smode=showBag&amp;brand=${param.brand}"/>">My Selections</a></li>
    </ul>
    
    <form id="top_search_form" method="get" action="<html-el:rewrite page="/search"/>" role="search">
      	<fieldset>
        	<input type="hidden" name="brand" value="<c:out value="${param.brand}"/>" />
        	<input type="hidden" name="style" value="" />
        	<input type="hidden" name="smode" value="simple" />
       		<input type="hidden" name="rmode" value="none" />
        	<input type="hidden" name="field1" value="text"/>
        	<label for="freeformQuery">Search </label><input name="freeformQuery" type="text" size="20" id="freeformQuery" value="keyword search" onfocus="doClear(this)" />
        	<input type="submit" value="Search" onclick="return checkTopForm();" />
      	</fieldset>
      </form>
    
    <a style="display:block" href="<html-el:rewrite page="/welcome.do?brand=${param.brand}"/>">
    <div id="bannerDiv" role="banner">
      <h1 class="banner"><c:out value="${brandName}"/></h1>
      <img id="banner" src="<html-el:rewrite page="/images/${param.brand}.png"/>" alt="<c:out value="${brandName}"/>" title="<c:out value="${brandName}"/>" />
    </div>
    </a>
    
    <div id="navigation" role="navigation">
      <ul id="main_nav">
        <li><a href="<html-el:rewrite page="/search?smode=advanced&amp;brand=${param.brand}"/>">Search</a></li>
        <li class="spaceout">Browse:</li>
        <li><a href="<html-el:rewrite page="/browse.do?type=creator&amp;filter=A&amp;brand=${param.brand}"/>" title="Browse by Author">Author </a></li>
        <li class="pipe"><a href="<html-el:rewrite page="/browse.do?type=title&amp;filter=A&amp;brand=${param.brand}"/>" title="Browse by Title">Title </a></li>
        <li class="pipe"><a href="<html-el:rewrite page="/browse.do?type=daterange&amp;filter=num&amp;brand=${param.brand}"/>" title="Browse by Publication Year">Year</a></li>
      </ul>
      
      <a id="skipnavLink"></a>
    </div>
    

