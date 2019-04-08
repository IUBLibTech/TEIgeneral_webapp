<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/x.tld" prefix="x"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean-el"%>

<div id="content" role="main">

    
	<h2 id="mainheading">
      <c:if test="${empty param.type}">
      Browse
      </c:if> <c:if test="${param.type == 'title'}">
      Browse by Title
      </c:if> <c:if test="${param.type == 'creator'}">
      Browse by Author
      </c:if> <c:if test="${param.type == 'daterange'}">
      Browse by Year
      </c:if>
      <c:if test="${param.type == 'genre'}">
      	Browse by Genre
      </c:if>

      </h2> 

<c:if test="${empty param.type}">

        <h4 class="normal"><a href="?type=creator&amp;filter=B" class="text" title="Click to browse by author">Author</a>
        </h4>

        <h4 class="normal"><a href="?type=title&amp;filter=num" class="text" title="Click to browse by subject">Title</a>
        </h4>
        
        <h4 class="normal"><a href="?type=daterange&amp;filter=num" class="text" title="Click to browse by repository">Year</a>
        </h4>
</c:if>

<c:if test="${ (!empty param.type) && (param.type != 'repository') }">

    <c:if test="${ (!empty param.type) && (param.type != 'daterange') && (param.type != 'genre') }">
	<div id="AZContainer">
	    <c:if test="${param.type == 'subject' }">
	    <c:url var="url" value="/browse.do">
			<c:param name="type" value="${param.type}" />
			<c:param name="filter" value="num" />
			<c:param name="brand" value="${param.brand}" />
		</c:url>
		<c:choose>
			<c:when test="${param.filter == 'num'}">
			    <b><c:out value="#"/></b>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<a href='<c:out value="${url}"/>' title='Click to see titles beginning with numbers'><c:out value="#" /></a>  &nbsp;&nbsp;
			</c:otherwise>
		</c:choose>	 
		</c:if> 
	  
	  <c:forTokens items="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" delims="," var="letter">
		<c:url var="url" value="/browse.do">
			<c:param name="type" value="${param.type}" />
			<c:param name="filter" value="${letter}" />
			<c:param name="brand" value="${param.brand}" />
		</c:url>
		<c:choose>
			<c:when test="${letter != param.filter}">
				<a href='<c:out value="${url}"/>' title='Click to see titles beginning with letter <c:out value="${letter}"/>'><c:out value="${letter}" /></a>
			</c:when>
			<c:otherwise>
				<strong><c:out value="${letter}" /></strong>
			</c:otherwise>
		</c:choose>
	</c:forTokens></div>
	</c:if>

	<c:url var="browseUrl" value="/search?smode=simple;rmode=none;style=;brand=wright" />

	<c:import var="list" url="http://webapp1.dlib.indiana.edu/collections/TEIgeneral/browse/${param.type}.xml" charEncoding="utf-8"  />
	<c:import var="list2html" url="/WEB-INF/tiles/pages/browse/list2html.xsl" />
	<c:if test="${empty param.filter}">
		<c:set var="filter" value="" />
	</c:if>
	<c:if test="${!empty param.filter}">
		<c:set var="filter" value="${param.filter}" />
	</c:if>
	<c:choose> 
		<c:when test="${param.type == 'genre'}">
			<c:set var="sort" value="creator" />
		</c:when>
		<c:when test="${param.type == 'daterange'}">
			<c:set var="sort" value="date" />
		</c:when>
		<c:when test="${param.type == 'title'}">
			<c:set var="sort" value="title" />
		</c:when>
		<c:when test="${param.type == 'creator'}">
			<c:set var="sort" value="creator" />
		</c:when>
		<c:otherwise>
			<c:set var="sort" value="" />
		</c:otherwise>
	</c:choose>
	<div id="browseResults">
	<x:transform xml="${list}" xslt="${list2html}">
		<x:param name="filter" value="${filter}" />
		<x:param name="url" value="${browseUrl}" />
		<x:param name="field" value="${param.type}" />
		<x:param name="sort" value="${sort}" />
	</x:transform>
	</div>
</c:if> 
<!-- list of finding aid repositories goes here --> 
<c:if test="${param.type == 'repository'}">
	<c:url var="url" value="/search"/>
	<c:import var="list" url="http://www.dlib.indiana.edu/collections/findingaids/browse/repository.xml" charEncoding="utf-8"/>
	<c:import var="list2html" url="/WEB-INF/tiles/pages/browse/list2html.xsl" />
	<x:transform xml="${list}" xslt="${list2html}">
		<x:param name="url" value="${url}" />
		<x:param name="field" value="${param.type}" />
	</x:transform>
</c:if>
    
</div>


<div class="clear"></div>
