<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:form action="/search/advanced.do">
  <table class="container">
    <tr valign="top">
      <td>
      <table class="searchForm">
        <tr>
          <td colspan="4">
          <h4>Advanced Search</h4>
          </td>
        </tr>

        <tr>
          <td width="150">Search:</td>
          <td><html:text property="text1" size="30" /></td>
          <td><html:select property="field1">
            <html:option value="text">Anywhere</html:option>
            <html:option value="creator">Creator</html:option>
            <html:option value="name">Names</html:option>
            <html:option value="subject">Subject</html:option>
            <html:option value="callnum">Collection No.</html:option>
            <html:option value="colltitle">Collection TItle</html:option>
            <html:option value="eaddsc">Contents List</html:option>
          </html:select></td>
          <td><html:select property="op1">
            <html:option value="and">and</html:option>
            <html:option value="or">or</html:option>

            <html:option value="not">not</html:option>
          </html:select></td>
        </tr>
        <tr>
          <td></td>
          <td><html:text property="text2" size="30" /></td>
          <td><html:select property="field2">
            <html:option value="text">Anywhere</html:option>
            <html:option value="creator">Creator</html:option>
            <html:option value="name">Names</html:option>
            <html:option value="subject">Subject</html:option>
            <html:option value="callnum">Collection No.</html:option>
            <html:option value="colltitle">Collection TItle</html:option>
            <html:option value="eaddsc">Contents List</html:option>
          </html:select></td>
          <td><html:select property="op2">
            <html:option value="and">and</html:option>
            <html:option value="or">or</html:option>

            <html:option value="not">not</html:option>
          </html:select></td>
        </tr>
        <tr>
          <td></td>
          <td><html:text property="text3" size="30" /></td>
          <td><html:select property="field3">
            <html:option value="text">Anywhere</html:option>
            <html:option value="creator">Creator</html:option>
            <html:option value="name">Names</html:option>
            <html:option value="subject">Subject</html:option>
            <html:option value="callnum">Collection No.</html:option>
            <html:option value="colltitle">Collection TItle</html:option>
            <html:option value="eaddsc">Contents List</html:option>
          </html:select></td>
          <td></td>
        </tr>
        <tr>
          <td><br />
          </td>

          <td colspan="3"><br />
          <br />
          <html:submit value="Search" /> <html:reset value="Clear" /> 
          <html:hidden property="step" value="query" />
          <html:hidden property="type" value="advanced" />
          </td>
        </tr>
      </table>
      </td>
      <td width="100"></td>
      <td>
      <table class="sideSection">
        <tr>
          <td>
          </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>
</html:form>
