<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/main" prefix="h" %>

<%@attribute name="entry" required="true" type="de.dentrassi.pm.common.web.menu.Node"%>

<c:if test="${not empty entry }">
<h:iconLabel label="${entry.label }" icon="${entry.icon }" />
</c:if>
