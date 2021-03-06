package epam.chernova.finalproject.service.impl;


import epam.chernova.finalproject.entity.Order;
import epam.chernova.finalproject.exception.DaoException;
import epam.chernova.finalproject.exception.ServiceException;
import epam.chernova.finalproject.factory.DaoFactory;
import epam.chernova.finalproject.service.OrderService;
import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.util.List;


public class OrderServiceImpl implements OrderService {
    private static final Logger LOGGER = LogManager.getLogger(OrderServiceImpl.class);
    private static DaoFactory daoFactory = DaoFactory.getInstance();


    @Override
    public Order findActiveOrderByClientId(int idClient) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start findActiveOrderByClientId");
        try {
            LOGGER.log(Level.DEBUG, "OrderService: Finish findActiveOrderByClientId");
            return daoFactory.getOrderDao().findActiveOrderByClientId(idClient);
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }
    }

    @Override
    public void editOrderCost(int idOrder, double deltaTotalCost) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start editOrder");
        try {
            daoFactory.getOrderDao().editOrderCost(idOrder, deltaTotalCost);
            LOGGER.log(Level.DEBUG, "OrderService: Finish editOrder");
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }

    }

    @Override
    public void addOrder(int idClient) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start addOrder");
        try {
            daoFactory.getOrderDao().addOrder(idClient);
            LOGGER.log(Level.DEBUG, "OrderService: Finish addOrder");
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }

    }

    @Override
    public List<Order> findAllOrdersByClientId(int idClient) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start findAllOrdersByClientId");
        try {
            LOGGER.log(Level.DEBUG, "Order Service: Finish findAllOrdersByClientId");
            return daoFactory.getOrderDao().findAllOrdersByClientId(idClient);
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }
    }

    @Override
    public List<Order> findAllOrders() throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start findAllOrders");
        try {
            LOGGER.log(Level.DEBUG, "Order Service: Finish findAllOrders");
            return daoFactory.getOrderDao().findAllOrders();
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }
    }

    @Override
    public Order findOrderByOrderId(int idOrder) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start findOrderByOrderId");
        try {
            LOGGER.log(Level.DEBUG, "Order Service: Finish findOrderByOrderId");
            return daoFactory.getOrderDao().findOrderByOrderId(idOrder);
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }

    }

    @Override
    public void payOrder(int idOrder) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start payOrder");
        try {
            daoFactory.getOrderDao().payOrder(idOrder);
            LOGGER.log(Level.DEBUG, "Order Service: Finish payOrder");
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }
    }

    @Override
    public void deleteEmptyOrder(int idClient) throws ServiceException {
        LOGGER.log(Level.DEBUG, "OrderService: Start deleteEmptyOrder");
        try {
            LOGGER.log(Level.DEBUG, "OrderService: Finish deleteEmptyOrder");
            daoFactory.getOrderDao().deleteEmptyOrder(idClient);
        } catch (DaoException e) {
            throw new ServiceException(this.getClass() + ":" + e.getMessage());
        }
    }


}
