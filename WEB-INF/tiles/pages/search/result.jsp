<%@ taglib uri="/WEB-INF/xtf.tld" prefix="xtf"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/xml" prefix="x"%> 

<%--
<xtf:crossquery />
--%>
<div class="search-results-outer">
<h3>Search Results</h3>
<p>Your search for <span class="search-term">herman wells</span> in <span
  class="search-type"> Names </span> found <c:out value="${result.totalDocs}" />
item(s). <a class="top-link" href="search.do">New Search</a> <a class="top-link"
  href="todo: modify search">Modify Search</a></p>
<div class="number-items">Displaying <c:out value="${result.startDoc+1}" />
- <c:out value="${result.endDoc}" /> of <strong
  xmlns:xs="http://www.w3.org/2001/XMLSchema"> <c:out
  value="${result.totalDocs}" /></strong> items</div>

<!--BEGIN SEARCH BAR-->
<div class="search-bar-outer-ead">
<table width="100%" border="0">
  <tr>
    <td align="left">
    <form class="search-form" method="get" action="search.do"><span
      class="form-element">Sort by:</span><select size="1" name="sort">
      <option value="" selected="selected">Relevance</option>
      <option value="title">Collection Title</option>

      <option value="publisher">Contributing Institution</option>
      <option value="year">Collection Dates</option>
    </select><input xmlns:xs="http://www.w3.org/2001/XMLSchema" type="hidden" name="text"
      value="herman wells" /><input xmlns:xs="http://www.w3.org/2001/XMLSchema"
      type="hidden" name="sectionType" value="name" /><input type="hidden"
      name="style" value="" /><input type="hidden" name="smode" value="simple" /><input
      type="hidden" name="brand" value="ead" /><span class="form-element">
    <input type="submit" value="Go!" /></span></form>
    </td>
    <td align="right"><span class="pagenumber-links"></span></td>
  </tr>
</table>
</div>
<!--END SEARCH BAR-->
<table class="search-results-table" border="0">
  <c:forEach var="docHit" items="${result.docHits}" varStatus="status">
    <tr class="search-row">
      <td class="search-results-number">
        <c:out value="${result.startDoc + status.index + 1}"/>. 
      </td>
      <td class="search-results-text">
      <div class="search-results-text-inner">
      <table border="0" cellpadding="2" width="95%">
        <tr>
          <td><strong>Title: </strong></td>
          <td>
            <c:url var="url" value="/view.do">
              <c:param name="docId" value="${docHit.metaData['identifier']}"/>
              <c:param name="query" value="${query}"/>
            </c:url>
            <a href="<c:out value="${url}"/>">
              <c:out value="${docHit.metaData['title']}"/>
            </a></td>
        </tr>
        <tr>
          <td><strong>Creator: </strong></td>
          <td><c:out value="${docHit.metaData['creator']}"/></td>
        </tr>

        <tr>
          <td valign="top"><strong>Abstract:</strong></td>
          <td><c:out value="${docHit.metaData['abstract']}"/></td>
        </tr>
        <tr>
          <td colspan="2"><strong>Search terms in context (<c:out value="${docHit.totalSnippets}"/>):</strong></td>
        </tr>

        <tr>
          <td></td>
          <td>
          <div class="search-results-snippets">
            <c:forEach var="snippet" items="${docHit.snippets}">
              <c:url var="snippetUrl" value="/view.do">
                <c:param name="docId" value="${docHit.metaData['identifier']}"/>
                <c:param name="query" value="${query}"/>
                <c:param name="sectionType" value="${snippet.sectionType}"/>
                <c:param name="hit.rank" value="${snippet.rank}"/>
              </c:url>
              ... <c:out value="${snippet.textBeforeHit}"/>
              <a href="<c:out value="${snippetUrl}"/>"><c:out value="${snippet.hit}"/></a>
              <c:out value="${snippet.textAfterHit}"/> ... <br/>
            </c:forEach>
          </div>
          </td>
        </tr>
      </table>
      </div>
      </td>
    </tr>

  </c:forEach>
</table>
</div>