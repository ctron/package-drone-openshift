<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib tagdir="/WEB-INF/tags/main" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://dentrassi.de/pm/storage" prefix="storage" %>
<%@ taglib uri="http://dentrassi.de/pm" prefix="pm" %>
<%@ taglib uri="http://dentrassi.de/osgi/web" prefix="web" %>


<%
pageContext.setAttribute ( "manager", request.isUserInRole ( "MANAGER" ) );
%>

<web:define name="list">
	<c:forEach var="artifact" items="${storage:nameSorted ( artifacts ) }">
		<tr style="display: none;" data-parent="${parent }" data-parents="${ parents }" data-level="${level }">
		    <td style="padding-left: ${1+(level*2)}em;">
		      <c:choose>
		          <c:when test="${not empty map.get(artifact.id) }">
		              <a data-artifact="${artifact.id }" class="expander" href="#"><i class="fa fa-plus-square-o"></i></a>
		          </c:when>
		          <c:otherwise>
                      <i style="visibility: hidden;" class="fa fa-square-o"></i>
                  </c:otherwise>
		      </c:choose>
		      
		      ${fn:escapeXml(artifact.name) }
		    </td>
		    
		    <td>
                <c:forEach var="value" items="${pm:metadata(artifact.metaData, null, 'artifactLabel') }" >
                    <span class="label label-info">${fn:escapeXml(value) }</span>
                </c:forEach>
		    </td>
		    
		    <td class="text-right"><web:bytes amount="${artifact.size }"/></td>
		    
		    <td style="white-space: nowrap;"><fmt:formatDate value="${artifact.creationTimestamp }" type="both" /> </td>
		    
		    <td><a href="<c:url value="/artifact/${artifact.id}/get"/>">Download</a></td>
	        <td>
	          <c:if test='${artifact.is("deletable") and manager}'><a href="<c:url value="/artifact/${artifact.id}/delete"/>">Delete</a></c:if>
	        </td>
	        <td><a href="<c:url value="/artifact/${artifact.id}/view"/>">Details</a></td>
	        <td><a href="<c:url value="/artifact/${artifact.id}/dump"/>">View</a></td>
		</tr>
		
		<web:call name="list" parent="${artifact.id }" parents="${parents } ${artifact.id }" artifacts="${map.get(artifact.id) }" level="${level+1 }"/>
	</c:forEach>
</web:define>

<h:main title="Channel" subtitle="${storage:channel(channel) }">

<style>
a.popup-ajax {
    color: inherit;
}
</style>

<h:buttonbar menu="${menuManager.getActions(channel) }" />

<h:nav menu="${menuManager.getViews(channel) }" />


<div class="table-responsive">
	<table id="artifacts" class="table table-striped table-condensed table-hover">
	
		<thead>
		    <tr>
		        <th>Name</th>
		        <th>Classifier</th>
		        <th>Size</th>
		        <th>Created</th>
		        <th></th>
		        <th></th>
		        <th></th>
		        <th></th>
		    </tr>
		</thead>
	
		<tbody>
		    <web:call name="list" map="${treeArtifacts }" artifacts="${treeArtifacts.get(null) }" level="${0 }"/>
		</tbody>
	
	</table>
</div>

<script type="text/javascript">
$(".expander").click(function (event) {
	event.preventDefault();
	var expanded = $(this).hasClass ( "opened" );
	var id = $(this).data("artifact");
	console.log ( "Expanded: " + expanded );
	console.log ( "parent: " + id );
	console.log ( $(this) );
	if ( expanded ) {
        $(this).children("i").removeClass ( "fa-minus-square-o");
        $(this).children("i").addClass ( "fa-plus-square-o");
	    $(this).removeClass("opened");
	    $('tr[data-parents~=' + id + ']').hide();
	    $('tr[data-parents~=' + id + '] a.expander' ).removeClass("opened");
	    $('tr[data-parents~=' + id + '] a.expander > i' ).removeClass("fa-minus-square-o");
	    $('tr[data-parents~=' + id + '] a.expander > i' ).addClass("fa-plus-square-o");
	}
	else {
		$(this).children("i").removeClass ( "fa-plus-square-o");
        $(this).children("i").addClass ( "fa-minus-square-o");
        $(this).addClass("opened");
        $('tr[data-parent=' + id + ']').show();
	}
});

$('tr[data-level=0]').show ();
</script>

</h:main>