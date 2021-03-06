<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean class="epam.chernova.finalproject.entity.Order" scope="page" id="order"/>
<jsp:useBean class="epam.chernova.finalproject.entity.Product" scope="page" id="product"/>
<jsp:useBean class="epam.chernova.finalproject.entity.OrderProduct" scope="page" id="orderProduct"/>
<jsp:useBean class="epam.chernova.finalproject.entity.Client" scope="page" id="client"/>

<fmt:setLocale scope="session" value="${locale}"/>
<fmt:setBundle basename="localization.pageInformation" scope="session" var="loc"/>
<fmt:message bundle="${loc}" key="local.word.order_word" var="order_word"/>
<fmt:message bundle="${loc}" key="local.word.total_cost" var="total_cost"/>
<fmt:message bundle="${loc}" key="local.word.remove_from_basket" var="remove_from_basket"/>
<fmt:message bundle="${loc}" key="local.word.has_been_paid" var="has_been_paid"/>
<fmt:message bundle="${loc}" key="local.word.pay" var="pay"/>
<fmt:message bundle="${loc}" key="local.word.open" var="open"/>
<fmt:message bundle="${loc}" key="local.word.status_word" var="status_word"/>
<fmt:message bundle="${loc}" key="local.word.client_word" var="client_word"/>
<fmt:message bundle="${loc}" key="local.word.close_order_word" var="close_order_word"/>

<style>
    <%@include file="/front/css/orderlist.css" %>
</style>

<div class="order-container">

    <div class="qa-message-list">

        <c:choose>
            <c:when test="${orders!=null}">
                <c:forEach var="order" items="${orders}">


                    <div class="message-item">
                        <div class="message-inner">
                            <div class="message-head clearfix">
                                <div class="user-detail">


                                    <h5 class="handle">${order_word} ${order.idOrder} </h5>

                                    <c:forEach var="client" items="${clients}">
                                        <form action="/epam.by/close_order?idOrder=${order.idOrder}&idClient=${client.idUser}"
                                              method="post">
                                            <c:choose>
                                                <c:when test="${order.idClient==client.idUser}">
                                                    <h5 class="handle">${client_word}
                                                        :${client.surname} ${client.name}</h5>
                                                    <c:if test="${order.status eq 'true'}">
                                                        <button type="submit" id="delete-admin-button" class="btn-right"
                                                                class="btn btn-default">${close_order_word}</button>
                                                    </c:if>
                                                </c:when>
                                            </c:choose>
                                        </form>
                                    </c:forEach>


                                    <c:choose>
                                        <c:when test="${order.status eq 'true'}">
                                            <h5 class="handle">${status_word}: ${open} </h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5 class="handle">${status_word}: ${has_been_paid} </h5>
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="post-meta">
                                        <div class="asker-meta">
                                            <span class="qa-message-what"></span>
                                            <span class="qa-message-when">
 <span class="qa-message-when-data">${order.date}</span>
                                                <span class="qa-message-when-data">${client.address}</span>

 </span>
                                            <span class="qa-message-who">
 <span class="qa-message-who-pad">${total_cost} </span>
 <span class="qa-message-who-data">${order.totalCost}</span>
 </span>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="qa-message-content">
                                <c:forEach var="orderProduct" items="${order_products}">

                                    <c:if test="${orderProduct.idOrder==order.idOrder}">
                                        <c:forEach var="product" items="${products}">
                                            <c:if test="${orderProduct.idProduct==product.idProduct}">

                                                <p>
                                                    <c:choose>
                                                        <c:when test="${locale eq 'ru'}">
                                                            ${product.nameRu} (${product.cost} BYN x ${orderProduct.quantity})
                                                        </c:when>
                                                        <c:when test="${locale eq 'en'}">
                                                            ${product.nameEn} (${product.cost} BYN x ${orderProduct.quantity})
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${product.exist eq 'false'}">
                                                            <small style="float: right">${not_exist}</small>
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </c:if>
                                        </c:forEach>

                                    </c:if>


                                </c:forEach>
                            </div>
                        </div>
                    </div>


                </c:forEach>
            </c:when>
        </c:choose>
    </div><!-- ./qa-message-list -->

</div>
<!-- ./container -->
