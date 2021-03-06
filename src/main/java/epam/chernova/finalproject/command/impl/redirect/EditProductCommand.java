package epam.chernova.finalproject.command.impl.redirect;

import epam.chernova.finalproject.command.ICommand;
import epam.chernova.finalproject.exception.ServiceException;
import epam.chernova.finalproject.factory.ServiceFactory;
import epam.chernova.finalproject.util.SessionElements;
import epam.chernova.finalproject.webenum.PageName;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditProductCommand implements ICommand {
    private static final Logger LOGGER = Logger.getLogger(EditProductCommand.class);
    private ServiceFactory serviceFactory = ServiceFactory.getInstance();
    private PageName pageName = PageName.INDEX;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        LOGGER.log(Level.INFO, "Command:Start EditProductCommand");
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        String type = request.getParameter("product_type");
        String nameEn = request.getParameter("nameEn");
        String nameRu = request.getParameter("nameRu");
        Double cost = Double.parseDouble(request.getParameter("cost"));
        Double weight = Double.parseDouble(request.getParameter("weight"));
        String imagePath = request.getParameter("image");
        try {
            if (serviceFactory.getProductService().findProductByNameAndId(nameEn, nameRu,idProduct) != null) {
                diagnoseCommonName(request);
            } else {
                serviceFactory.getProductService().editProduct(idProduct,type, nameEn, nameRu, cost, weight, imagePath);
            }
            response.sendRedirect(SessionElements.getPageCommand(request));
        } catch (IOException |
                ServiceException e) {
            LOGGER.log(Level.ERROR, this.getClass() + ":" + e.getMessage());
            pageName = PageName.ERROR;
        }
        LOGGER.log(Level.INFO, "Command:Finish EditProductCommand");
        return pageName.getPath();
    }

    private static void diagnoseCommonName(HttpServletRequest request) {
        if (request.getSession().getAttribute("locale").equals("ru")) {
            request.getSession().setAttribute("error_data", "Блюдо с данным названием уже присутствует в меню.");
        } else {
            request.getSession().setAttribute("error_data", "Dish with this name is already exist in menu.");
        }
    }

}
