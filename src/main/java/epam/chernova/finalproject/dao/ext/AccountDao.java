package epam.chernova.finalproject.dao.ext;

import epam.chernova.finalproject.connectionpool.ConnectionPool;
import epam.chernova.finalproject.dao.IAccountDao;
import epam.chernova.finalproject.dao.IOrderDao;
import epam.chernova.finalproject.entity.Account;
import epam.chernova.finalproject.entity.Order;
import epam.chernova.finalproject.exception.ConnectionPoolException;
import epam.chernova.finalproject.exception.DaoException;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDao implements IAccountDao {
    private static final Logger LOGGER = Logger.getLogger(AccountDao.class);
    private static final String FIND_ACCOUNT_BY_CLIENT_ID = "SELECT * FROM cafe.account WHERE cafe.account.client_user_iduser =?";
    private static final String FIND_ACCOUNT_BY_NUMBER = "SELECT * FROM cafe.account WHERE cafe.account.account_number =?";
    private static final String PAY_ORDER = "UPDATE cafe.account SET cafe.account.credit = (cafe.account.credit - ?) WHERE cafe.account.client_user_iduser = ?";
    private static final String PAY_PART_ORDER = "UPDATE cafe.account SET cafe.account.credit = 0 WHERE cafe.account.client_user_iduser = ?";
    private static final String DELETE_ACCOUNT = "DELETE FROM account WHERE account.idaccount=?";
    private static final String ADD_ACCOUNT = "INSERT INTO account (client_user_iduser,account_number,credit) VALUES (?,?,?)";
    private ConnectionPool connectionPool;
    private Connection connection;
    private ResultSet resultSet;
    private PreparedStatement statement;

    @Override
    public Account findAccountByClientId(int idClient) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start findAccountByClientId");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(FIND_ACCOUNT_BY_CLIENT_ID);
                statement.setInt(1, idClient);
                resultSet = statement.executeQuery();
                if (resultSet.first()) {
                    return createAccountByResultSet(resultSet);
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish findAccountByClientId");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
        return null;

    }

    @Override
    public void payOrder(int idClient, double totalCost) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start payOrder");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(PAY_ORDER);
                statement.setDouble(1, totalCost);
                statement.setInt(2, idClient);
                if (statement.executeUpdate() != 0) {
                    return;
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish payOrder");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
    }

    @Override
    public void payPartOrder(int idClient) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start payPartOrder");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(PAY_PART_ORDER);
                statement.setInt(1, idClient);
                if (statement.executeUpdate() != 0) {
                    return;
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish payPartOrder");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }

    }

    @Override
    public void deleteAccount(int idAccount) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start deleteAccount");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(DELETE_ACCOUNT);
                statement.setInt(1, idAccount);
                if (statement.executeUpdate() != 0) {
                    return;
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish deleteAccount");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
    }

    @Override
    public Account findAccountByNumber(String accountNumber) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start findAccountByNumber");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(FIND_ACCOUNT_BY_NUMBER);
                statement.setString(1, accountNumber);
                resultSet = statement.executeQuery();
                if (resultSet.first()) {
                    return createAccountByResultSet(resultSet);
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish findAccountByNumber");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
        return null;
    }

    @Override
    public void addAccount(int idClient, String accountNumber, double credit) throws DaoException {
        LOGGER.log(Level.DEBUG, "Account DAO: start addAccount");
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.getConnection();
            try {
                statement = connection.prepareStatement(ADD_ACCOUNT);
                statement.setInt(1, idClient);
                statement.setString(2, accountNumber);
                statement.setDouble(3, credit);
                if (statement.executeUpdate() != 0) {
                    return;
                }
            } finally {
                LOGGER.log(Level.DEBUG, "Account DAO: finish addAccount");
                close(resultSet, statement);
                connectionPool.putBackConnection(connection);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
    }

    private Account createAccountByResultSet(ResultSet resultSet) throws DaoException {
        Account account;
        try {
            account = new Account();
            account.setIdAccount(resultSet.getInt("idaccount"));
            account.setCredit(resultSet.getDouble("credit"));
            account.setAccountNumber(resultSet.getString("account_number"));
            account.setIdClient(resultSet.getInt("client_user_iduser"));
        } catch (SQLException e) {
            throw new DaoException("Exception while executing SQL query", e);
        }
        return account;
    }
}
