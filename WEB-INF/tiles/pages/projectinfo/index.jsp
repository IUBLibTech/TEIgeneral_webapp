<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>

<div id="content" class="clearfix" role="main">
   	<h2 id="mainheading">Project Information</h2>
   	<div class="viewFullWidth">
   		<h3><a href="<html-el:rewrite page=""/>/projectinfo/copyright.do?brand=<c:out value="${param.brand}"/>">Copyright and Conditions of Use</a></h3>
   		<h3><a href="<html-el:rewrite page=""/>/projectinfo/people.do?brand=<c:out value="${param.brand}"/>">Project Partners</a></h3>
   		<h3><a href="<html-el:rewrite page=""/>/projectinfo/encoding.do?brand=<c:out value="${param.brand}"/>">Encoding Overview</a></h3>
   		<h3><a href="<html-el:rewrite page=""/>/projectinfo/technical.do?brand=<c:out value="${param.brand}"/>">Technical Implementation Overview</a></h3>
   	</div>
   	<div class="viewFullWidth">
   		<p>
   			When the project was conceived in 2000, the Wright American Fiction collection from this 25-year period presented a significant opportunity for a cooperative project due to its size and relationship with other large text collections at the time including Chadwyck-Healey's <a href="http://www.chadwyck.com/products/viewproduct.asp?key=773">Early American Fiction</a>, which ends at 1850, and the University of Michigan and Cornell's <a href="http://moa.umdl.umich.edu/">Making of America</a>, which covers 1850&ndash;77, but at the time excluded fiction.
   		</p>
   		<p>The project was originally developed in phases as follows:</p>
   		<h3>Phase One</h3>
   		<p>
   			Digitize page images. Each frame from the microfilm set, most of which contain two pages, was digitized by <a href="http://www.oclc.org/oclc/presres/">Preservation Resources</a>. The conversion output resulted in almost 400,000 bitonal TIFF image files, or over 750,000 pages. The following CIC Libraries contributed to this phase:
   		</p>
   		<ul>
   			<li>Indiana University</li>
			<li>Michigan State University</li>
			<li>Ohio State University</li>
			<li>University of Illinois, Chicago</li>
			<li>University of Illinois, Urbana-Champaign</li>
			<li>University of Iowa</li>
			<li>University of Michigan</li>
			<li>University of Minnesota</li>
			<li>University of Wisconsin</li>
		</ul>
		
		<h3>Phase Two</h3>
		<p>
			Convert to Text Files. Each TIFF file is processed by Optical Character Recognition (OCR) software, from <a href="http://www.primerec.com/">Prime Recognition</a>. This work was conducted at the Digital Library Program offices at Indiana University.
		</p>
		
		<h3>Phase Three</h3>
		<p>
			Edit and Encode the Text Files. The OCR process is seldom perfect; there are many errors in the text files that need to be corrected. Three universities have committed to contributing $17,000 per year for 3 years to undergo editing and encoding:
		</p>
		<ul>
			<li>Indiana University</li>
			<li>University of Iowa</li>
			<li>University of Michigan</li>
		</ul>
		<p>In addition, 8 other CIC libraries have contributed toward this endeavor:</p>
		<ul>
			<li>University of Chicago</li>
			<li>University of Illinois, Urbana-Champaign</li>
			<li>Michigan State University</li>
			<li>University of Minnesota</li>
			<li>Northwestern University</li>
			<li>Ohio State University</li>
			<li>Pennsylvania State University</li>
			<li>University of Wisconsin</li>
		</ul>
		
		<h3>Phase Four</h3>
		<p>
			Create Search and Display Functionality. Indiana University originally licensed the <a href="http://www.dlxs.org/">Digital Library Extension Service</a> software from the University of Michigan for this project. A considerable amount of modification was necessary for the demands of this project.
		</p>
        <h3>Migration Phase</h3>
   		<p>
        In 2012, the Indiana University Libraries began the migration of the Wright American Fiction project. Due to limited resources, functionality, facsimile page image, and text encoding improvements were not actively sought except for those original files that did not include the full text.  Optical Character Recognition software was run against the existing facsimile page images to generate uncorrected OCR.  The Wright corpus is now full-text searchable in its entirety, comprised of edited, mid-level encoded texts and unedited, minimally encoded texts.  For more information about the current state of the encoding and publishing platform, consult the <a href="/TEIgeneral/projectinfo/encoding.do">Encoding Overview</a> and <a href="/TEIgeneral/projectinfo/technical.do">Technical Implementation Overview</a>.
        </p>
   	</div>
   	<br class="clear_both" />
</div> <!-- END CONTENT -->
