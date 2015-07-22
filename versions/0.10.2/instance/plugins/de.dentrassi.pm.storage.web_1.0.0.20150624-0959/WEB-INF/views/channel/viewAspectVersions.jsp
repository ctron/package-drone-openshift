<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib tagdir="/WEB-INF/tags/main" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://dentrassi.de/pm/storage" prefix="pm" %>
<%@ taglib uri="http://dentrassi.de/osgi/web" prefix="web" %>

<h:main title="Aspect states" subtitle="${pm:channel(channel) }">

<h:buttonbar>
    <jsp:attribute name="before">
        <div class="btn-group" role="group"><a class="btn btn-default" href="view">Cancel</a></div>
    </jsp:attribute>
    
    <jsp:attribute name="after">
        <div class="btn-group" role="group">
            <a href="<c:url value="/channel/${channel.id }/refreshAllAspects"/>" role="button" class="btn btn-success"><span class="glyphicon glyphicon-refresh"></span> Refresh aspects</a>
        </div>
    </jsp:attribute>
</h:buttonbar>

<div class="table-responsive">

    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>Aspect</th>
                <th>Installed version</th>
                <th>Data version</th>
            </tr>
        </thead>
        
        <c:forEach var="aspect" items="${aspects }">
            <tr class="${ (aspect.version ne states[aspect.factoryId]) ? 'warning' : '' }">
                <td>${fn:escapeXml(aspect.label) }</td>
                <td>${fn:escapeXml(aspect.version) }</td>
                <td>${fn:escapeXml(states[aspect.factoryId]) }</td>
            </tr>
        </c:forEach>
        
    </table>

</div>

</h:main>