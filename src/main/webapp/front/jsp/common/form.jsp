<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale scope="session" value="${locale}"/>
<fmt:setBundle basename="localization.pageInformation" scope="session" var="loc"/>
<fmt:message bundle="${loc}" key="local.word.authorization" var="authorization"/>
<fmt:message bundle="${loc}" key="local.word.login" var="login"/>
<fmt:message bundle="${loc}" key="local.word.password" var="password"/>
<fmt:message bundle="${loc}" key="local.word.enter" var="enter"/>
<fmt:message bundle="${loc}" key="local.word.administrator" var="administrator"/>
<fmt:message bundle="${loc}" key="local.word.registration" var="registration"/>
<fmt:message bundle="${loc}" key="local.word.name" var="name"/>
<fmt:message bundle="${loc}" key="local.word.surname" var="surname"/>
<fmt:message bundle="${loc}" key="local.word.email" var="email"/>
<fmt:message bundle="${loc}" key="local.word.registrate" var="registrate"/>
<fmt:message bundle="${loc}" key="local.sentence.login_mistake" var="login_mistake"/>
<fmt:message bundle="${loc}" key="local.sentence.password_mistake" var="password_mistake"/>
<fmt:message bundle="${loc}" key="local.sentence.name_mistake" var="name_mistake"/>
<fmt:message bundle="${loc}" key="local.sentence.surname_mistake" var="surname_mistake"/>
<fmt:message bundle="${loc}" key="local.sentence.email_mistake" var="email_mistake"/>
<fmt:message bundle="${loc}" key="local.sentence.adding_product" var="adding_product"/>
<fmt:message bundle="${loc}" key="local.word.breakfast" var="breakfast"/>
<fmt:message bundle="${loc}" key="local.word.pizza" var="pizza"/>
<fmt:message bundle="${loc}" key="local.word.sushi" var="sushi"/>
<fmt:message bundle="${loc}" key="local.word.snacks" var="snacks"/>
<fmt:message bundle="${loc}" key="local.word.hot_dishes" var="hot_dishes"/>
<fmt:message bundle="${loc}" key="local.word.soup" var="soups"/>
<fmt:message bundle="${loc}" key="local.word.desserts" var="desserts"/>
<fmt:message bundle="${loc}" key="local.word.coffe" var="coffe"/>
<fmt:message bundle="${loc}" key="local.word.cocoa" var="cocoa"/>
<fmt:message bundle="${loc}" key="local.word.tea" var="tea"/>
<fmt:message bundle="${loc}" key="local.word.smuzzi" var="smuzzi"/>
<fmt:message bundle="${loc}" key="local.word.name_en" var="name_en"/>
<fmt:message bundle="${loc}" key="local.word.name_ru" var="name_ru"/>
<fmt:message bundle="${loc}" key="local.word.product_name_mistake" var="product_name_mistake"/>
<fmt:message bundle="${loc}" key="local.word.cost" var="cost"/>
<fmt:message bundle="${loc}" key="local.word.weight" var="weight"/>
<fmt:message bundle="${loc}" key="local.word.cost_mistake" var="cost_mistake"/>
<fmt:message bundle="${loc}" key="local.word.weight_mistake" var="weight_mistake"/>
<fmt:message bundle="${loc}" key="local.word.add_product" var="add_product"/>
<fmt:message bundle="${loc}" key="local.word.choose_image" var="choose_image"/>
<fmt:message bundle="${loc}" key="local.word.adding_admin" var="adding_admin"/>
<fmt:message bundle="${loc}" key="local.word.repassword" var="repassword"/>
<fmt:message bundle="${loc}" key="local.word.repassword_mistake" var="repassword_mistake"/>
<fmt:message bundle="${loc}" key="local.word.changing_password" var="changing_password"/>
<fmt:message bundle="${loc}" key="local.word.password_old" var="password_old"/>
<fmt:message bundle="${loc}" key="local.word.password_new" var="password_new"/>
<fmt:message bundle="${loc}" key="local.word.adding_account" var="adding_account"/>
<fmt:message bundle="${loc}" key="local.word.account_number_mistake" var="account_number_mistake"/>
<fmt:message bundle="${loc}" key="local.word.changing_product" var="changing_product"/>
<fmt:message bundle="${loc}" key="local.word.change_product_word" var="change_product_word"/>
<fmt:message bundle="${loc}" key="local.word.address_word" var="address_word"/>
<fmt:message bundle="${loc}" key="local.word.reviewed_order" var="reviewed_order"/>
<fmt:message bundle="${loc}" key="local.word.your_review" var="your_review"/>
<fmt:message bundle="${loc}" key="local.word.review_mistake" var="review_mistake"/>
<fmt:message bundle="${loc}" key="local.word.make_review_word" var="make_review_word"/>
<fmt:message bundle="${loc}" key="local.word.address_mistake" var="address_mistake"/>

<head>
    <meta charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1">
    <link rel="stylesheet" href="http://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css"/>
    <link rel="stylesheet" href="http://bootstraptema.ru/snippets/menu/2016/slidemenu/slidemenu.css"/>
    <script src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
    <script src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script src="http://bootstraptema.ru/snippets/menu/2016/slidemenu/slidemenu.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <style>
        <%@include file="/front/css/form.css" %>
        <%@include file="/front/css/review.css" %>
    </style>
    <script>
        <%@include file="/front/js/form.js" %>
    </script>
</head>


<div class="modal" class="modal fade" class="cd-user-modal" id="sign_in" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="sign-in-form" class="form-horizontal form-horizontal-log" method="post"
                              action="/epam.by/sign_in">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${authorization}</span>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="inputLogin"
                                       placeholder=${login} name="login_in">
                                <span class="cd-error-message" id="login-span">${login_mistake}</span>

                            </div>
                            <div class="form-group help">
                                <input type="password" class="form-control has-border" id="inputPassword"
                                       placeholder=${password} name="password_in">
                                <span class="cd-error-message" id="password-span">${password_mistake}</span>

                            </div>
                            <div class="form-group">
                                <button type="submit" id="signin-button" class="btn btn-default">${enter}</button>
                            </div>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>


<div class="modal" class="modal fade" class="cd-user-modal" id="sign_up" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="sign-up-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/sign_up">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${registration}</span>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="name"
                                       placeholder=${name} name="name">
                                <span class="cd-error-message" id="name-up-span">${name_mistake}</span>

                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="surname"
                                       placeholder=${surname} name="surname">
                                <span class="cd-error-message" id="surname-up-span">${surname_mistake}</span>

                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control has-border" id="email"
                                       placeholder=${email} name="email">
                                <span class="cd-error-message" id="email-up-span">${email_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="address"
                                       placeholder=${address_word} name="address">
                                <span class="cd-error-message" id="address-up-span">${address_mistake}</span>

                            </div>


                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="login"
                                       placeholder=${login} name="login_up">
                                <span class="cd-error-message" id="login-up-span">${login_mistake}</span>

                            </div>
                            <div class="form-group help">
                                <input type="password" class="form-control has-border" id="password"
                                       placeholder=${password} name="password_up">
                                <span class="cd-error-message" id="password-up-span">${password_mistake}</span>

                            </div>

                            <button type="submit" id="signup-button" class="btn btn-default">${registrate}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>

<div class="modal" class="modal fade" class="cd-user-modal" id="add_product" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="add-product-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/add_product">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${adding_product}</span>

                            <div class="form-group">

                                <select id="product-type" name="product_type">
                                    <option value="breakfast">${breakfast}</option>
                                    <option value="pizza">${pizza}</option>
                                    <option value="sushi">${sushi}</option>
                                    <option value="snacks">${snacks}</option>
                                    <option value="hot_dishes">${hot_dishes}</option>
                                    <option value="hot_dishes">${hot_dishes}</option>
                                    <option value="soups">${soups}</option>
                                    <option value="desserts">${desserts}</option>
                                    <option value="coffe">${coffe}</option>
                                    <option value="cocoa">${cocoa}</option>
                                    <option value="tea">${tea}</option>
                                    <option value="smuzzi">${smuzzi}</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="nameEn"
                                       placeholder=${name_en} name="nameEn">
                                <span class="cd-error-message" id="name-en">${product_name_mistake}</span>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="nameRu"
                                       placeholder=${name_ru} name="nameRu">
                                <span class="cd-error-message" id="name-ru">${product_name_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="cost"
                                       placeholder=${cost} name="cost">
                                <span class="cd-error-message" id="cost-span">${cost_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="weight"
                                       placeholder=${weight} name="weight">
                                <span class="cd-error-message" id="weight-span">${weight_mistake}</span>

                            </div>

                            <div class="form-group">
                                <p>
                                    <label for="image" class="control-label" style="float: left">${choose_image}</label>
                                </p>
                                <input type="file" accept=".png, .jpg, .jpeg" style="float: right" name="image"
                                       id="image" required>
                                <span class="cd-error-message" id="image-span">${image_mistake}</span>

                            </div>

                            <button type="submit" id="add-product-button"
                                    class="btn btn-default">${add_product}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>


<div class="modal" class="modal fade" class="cd-user-modal" id="add_admin" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="add-admin-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/add_admin">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${adding_admin}</span>


                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="loginAdmin"
                                       placeholder=${login} name="login-admin">
                                <span class="cd-error-message" id="login-admin">${login_mistake}</span>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control has-border" id="passwordAdmin"
                                       placeholder=${password} name="password-admin">
                                <span class="cd-error-message" id="password-admin">${password_mistake}</span>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control has-border" id="repasswordAdmin"
                                       placeholder=${repassword} name="repassword-admin">
                                <span class="cd-error-message" id="repassword-admin">${password_mistake}</span>
                                <span class="cd-error-message" id="repassword-confirm">${repassword_mistake}</span>

                            </div>

                            <button type="submit" id="button"
                                    class="btn btn-default">${add_admin_word}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>

<div class="modal" class="modal fade" class="cd-user-modal" id="change_password" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="change-password-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/change_password">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${changing_password}</span>


                            <div class="form-group">
                                <input type="password" class="form-control has-border" id="passwordOld"
                                       placeholder=${password_old} name="password-old">
                                <span class="cd-error-message" id="password-old">${password_mistake}</span>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control has-border" id="passwordNew"
                                       placeholder=${password_new} name="password-new">
                                <span class="cd-error-message" id="password-new">${password_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control has-border" id="repasswordNew"
                                       placeholder=${repassword} name="repassword-new">
                                <span class="cd-error-message" id="repassword-new">${password_mistake}</span>
                                <span class="cd-error-message" id="repassword-new-confirm">${repassword_mistake}</span>

                            </div>

                            <button type="submit" id="button-password"
                                    class="btn btn-default">${change_password_word}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>

<div class="modal" class="modal fade" class="cd-user-modal" id="add_account" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="add-account-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/add_account">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${adding_account}</span>


                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="accountNumber"
                                       placeholder=${account_number} name="account-number">
                                <span class="cd-error-message" id="account-number">${account_number_mistake}</span>
                            </div>

                            <button type="submit"
                                    class="btn btn-default">${add_account_btn}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>


<div class="modal" class="modal fade" class="cd-user-modal" id="change_product" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="change-product-form" class="form-horizontal form-horizontal-reg" method="post"
                              action="/epam.by/edit_product?idProduct=${idProduct}">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${changing_product}</span>

                            <div class="form-group">

                                <select id="product-type-change" name="product_type">
                                    <option value="breakfast">${breakfast}</option>
                                    <option value="pizza">${pizza}</option>
                                    <option value="sushi">${sushi}</option>
                                    <option value="snacks">${snacks}</option>
                                    <option value="hot_dishes">${hot_dishes}</option>
                                    <option value="hot_dishes">${hot_dishes}</option>
                                    <option value="soups">${soups}</option>
                                    <option value="desserts">${desserts}</option>
                                    <option value="coffe">${coffe}</option>
                                    <option value="cocoa">${cocoa}</option>
                                    <option value="tea">${tea}</option>
                                    <option value="smuzzi">${smuzzi}</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="nameEnch"
                                       placeholder=${name_en} name="nameEn">
                                <span class="cd-error-message" id="name-en-ch">${product_name_mistake}</span>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="nameRuch"
                                       placeholder=${name_ru} name="nameRu" value="${product.nameRu}">
                                <span class="cd-error-message" id="name-ru-ch">${product_name_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="costch"
                                       placeholder=${cost} name="cost" value="${product.cost}">
                                <span class="cd-error-message" id="cost-span-ch">${cost_mistake}</span>

                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control has-border" id="weightch"
                                       placeholder=${weight} name="weight" value="${product.weight}">
                                <span class="cd-error-message" id="weight-span-ch">${weight_mistake}</span>

                            </div>
                            <input id="changeproductid" type="text" name="id" style="visibility: hidden">
                            <div class="form-group">
                                <p>
                                    <label for="image" class="control-label" style="float: left">${choose_image}</label>
                                </p>
                                <input type="file" accept=".png, .jpg, .jpeg" value="${product.imagePath}"
                                       style="float: right" name="image" id="imagech" required>
                                <span class="cd-error-message" id="image-span-ch">${image_mistake}</span>

                            </div>

                            <button type="submit" id="change-product-button"
                                    class="btn btn-default">${change_product_word}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>


<div class="modal" class="modal fade" class="cd-user-modal" id="add_review" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="container">
                <div class="row">

                    <div class="col-md-6">
                        <form id="add-review-form" class="form-horizontal form-horizontal-log" method="post"
                              action="/epam.by/add_review">

                            <button type="button" class="close" data-dismiss="modal" class="close">&times;</button>
                            <span class="heading">${reviewed_order}</span>

                            <div class="form-group">
                                <textarea rows="10" cols="45" class="form-control has-border" id="inputReview"
                                          placeholder=${your_review} name="review"
                                          style="height: 150px;padding-top: 6px"></textarea>
                                <span class="cd-error-message" id="review-span">${review_mistake}</span>

                            </div>
                            <div class="form-group help">
                                <div class="stars">
                                    <input class="star-rating__input" id="star-rating-5" type="radio" name="rating5"
                                           value="5">
                                    <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-5"
                                           title="5 out of 5 stars"></label>
                                    <input class="star-rating__input" id="star-rating-4" type="radio" name="rating4"
                                           value="4">
                                    <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-4"
                                           title="4 out of 5 stars"></label>
                                    <input class="star-rating__input" id="star-rating-3" type="radio" name="rating3"
                                           value="3">
                                    <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-3"
                                           title="3 out of 5 stars"></label>
                                    <input class="star-rating__input" id="star-rating-2" type="radio" name="rating2"
                                           value="2">
                                    <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-2"
                                           title="2 out of 5 stars"></label>
                                    <input class="star-rating__input" id="star-rating-1" type="radio" name="rating1"
                                           value="1">
                                    <label class="star-rating__ico fa fa-star-o fa-lg" for="star-rating-1"
                                           title="1 out of 5 stars"></label></div>
                            </div>
                            <button type="submit" class="btn btn-default">${make_review_word}</button>
                        </form>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div>
</div>


