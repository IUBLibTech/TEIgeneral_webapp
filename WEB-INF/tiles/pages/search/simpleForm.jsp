<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<div class="search-results-outer">
<h3>Simple Search</h3>
<html:form action="/search/simple.do">
  <html:hidden property="step" value="result"/>
   
      <p>Word or phrase<span class="spacer">
      <input name="text" type="text" size="20" value="" /></span><span class="spacer">within</span>
      <span class="search-type">
      <html:select property="field">
        <html:option value="text">Anywhere</html:option>
        <html:option value="creator">Creator</html:option>
        <html:option value="name">Names</html:option>
        <html:option value="subject">Subject</html:option>
        <html:option value="callnum">Collection No.</html:option>
        <html:option value="colltitle">Collection TItle</html:option>
        <html:option value="eaddsc">Contents List</html:option>
      </html:select></span>
      <span class="spacer">
        <html:submit value="Submit!"/>
      </span>
      </p>
   
</html:form>
<h4>Search tips:</h4>
<ul>
  <li>use single words or phrases, e.g., "vonnegut".</li>
  <li>for searches of multiple words, e.g. "wells" and "bloomington", use
  the Advanced Search</li>
</ul>
</div>
