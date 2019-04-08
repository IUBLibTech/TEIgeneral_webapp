<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el"%>
<%
	String pagename = request.getRequestURI();
	String baseURL = pagename.substring(1);
	baseURL = baseURL.substring(0, baseURL.indexOf("/"));
	baseURL = "/" + baseURL;
	if (request.getQueryString() != null) {
   		pagename += '?' + request.getQueryString();
   	}
	java.net.URL reconstructedURL = new java.net.URL(request.getScheme(), request.getServerName(), request.getServerPort(), pagename);
    String fullName = reconstructedURL.toString();	
    String pageName = fullName.replace("&", "&amp;");
%>

<!-- start footer -->
<div id="footer" role="contentinfo">
	<p>
    	<a href="http://www.dlib.indiana.edu">IU Digital Library Program</a>
	</p>
	<p>
		Comments: <a href="mailto:diglib@indiana.edu">diglib@indiana.edu</a>
	</p>
	<br />
	<a href="http://www.libraries.iub.edu/index.php?pageId=1137">Libraries Privacy Policy</a>
</div>

<div id="footerIU" role="contentinfo">
	<hr />
	<div id="copyright" style="width:auto;float:left">
		<div id="blockiu">
			<a href="http://www.indiana.edu/" title="Indiana University"><img src="/images/blockiu_white.gif" alt="Block IU" width="22" height="28" /></a>
		</div>
	<div id="statement">
			<a href="http://www.indiana.edu/comments/copyright.shtml" title="Copyright">Copyright</a> &copy; 
			<script type="text/javascript">
				<!--
				var current_date = new Date ( );
				document.write ( " " + current_date.getFullYear() );
				// -->
			</script>
			<!-- UPDATE THE NOSCRIPT TAG WITH THE CURRENT YEAR -->
			<noscript><p class="inline">2017</p></noscript>
			The Trustees of <a href="http://www.indiana.edu/" title="Indiana University">Indiana University</a> &#124; <a href="http://www.indiana.edu/comments/complaint.shtml" title="Copyright Complaints">Copyright Complaints</a> &#124; <a href="http://www.libraries.iub.edu/index.php?pageId=1137">Libraries Privacy Policy</a>
	</div>	
        </div>
        <span id="statement" style="margin: 0 30px 0 0;font-size: 85%;line-height: 250%;float:right">
                      <a href="https://accessibility.iu.edu/help" id="accessibility-link" title="Having trouble accessing this web page because of a disability? Visit this page for assistance.">Accessibility Help</a>
        </span> 
</div>
     
<!-- end footer -->  


