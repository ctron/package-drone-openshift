<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib tagdir="/WEB-INF/tags/main" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://dentrassi.de/pm/storage" prefix="pm" %>
<%@ taglib uri="http://dentrassi.de/osgi/web" prefix="web" %>

<%
pageContext.setAttribute ( "manager", request.isUserInRole ( "MANAGER" ) );
%>

<c:set var="idUrl" value="${ fn:escapeXml(sitePrefix.concat ( '/api/v1/upload/channel/' ).concat ( channel.id )) }"/>
<c:if test="${not empty channel.name }">
    <c:set var="nameUrl" value="${ fn:escapeXml(sitePrefix.concat ( '/api/v1/upload/channel/' ).concat ( web:encode(channel.name) )) }"/>
</c:if>

<c:set var="exampleUrl" value="${ fn:escapeXml(exampleSitePrefix.concat ( '/api/v1/upload/channel/' ).concat ( channel.id )) }" />

<h:main title="API Upload" subtitle="${pm:channel(channel) }">

<h:buttonbar menu="${menuManager.getActions(channel) }"/>
<h:nav menu="${menuManager.getViews(channel) }"/>

<div class="container-fluid form-padding">
    <c:if test="${empty groups }">
        <div class="alert alert-warning">
	        All further information in this page requires the channel to have at least one deploy
	        key assigned. However there are currently no deploy groups/keys assigned to this channel, so
	        it will not be possible to authenticate.
	        
	        <c:if test="${manager }">
	   	        <a class="alert-link" href="<c:url value="/channel/${channel.id }/deployKeys"/>">Assign deploy groups now</a>.
	        </c:if>
        </div>
    </c:if>
    
    <p>
        It is possible to upload to this channel by making a <code>PUT</code> request to the following URLs:
    </p>
    <ul>
        <li><code>${idUrl }</code></li>
        <c:if test="${not empty nameUrl }">
           <li><code>${nameUrl }</code></li>    
        </c:if>
    </ul>
    <p>
        <em>Note:</em> it is required to perform <q>Basic Authentication</q> using one of the assigned deploy keys.
    </p>
    
    <h3>Example</h3>
    
    <p>
        Using the command line tool <code>curl</code> you can deploy the file <code>my.jar</code> in the local directory to this channel:
    </p>
    
    <pre>curl -X PUT --data @<strong>my.jar</strong> ${exampleUrl }/<strong>my.jar</strong></pre>
    
    <p>If you want to set the provided meta data field <code>test:foo</code> to <code>bar</code> add these as request parameters:
    
    <pre>curl -X PUT --data @my.jar ${exampleUrl }/my.jar<strong>?test:foo=bar</strong></pre>
    
</div>

</h:main>