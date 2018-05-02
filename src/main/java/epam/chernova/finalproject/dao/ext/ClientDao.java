package epam.chernova.finalproject.dao.ext;

import epam.chernova.finalproject.connectionpool.ConnectionPool;
import epam.chernova.finalproject.dao.IClientDao;
import epam.chernova.finalproject.entity.ext.Client;
import epam.chernova.finalproject.exception.DaoException;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import java.sql.*;

public class ClientDao implements IClientDao {
    private static final Logger LOGGER = Logger.getLogger(ClientDao.class);
    private static final String FIND_BY_LOGIN_AND_PASSWORD = "SELECT * FROM client JOIN user ON client.user_iduser=user.iduser WHERE user.login =? AND user.password = ? AND user.role = 0";
    private static final String FIND_BY_LOGIN = "SELECT * FROM client JOIN user ON client.user_iduser=user.iduser WHERE user.login =?";
    private static final String FIND_BY_EMAIL = "SELECT * FROM client  WHERE user.email =?";
    private static final String ADD_USER = "INSERT INTO user (login,password,role) VALUES (?,?,?)";
    private static final String ADD_CLIENT = "INSERT INTO client (user_iduser,name,surname,email) VALUES (LAST_INSERT_ID(),?,?,?)";
    private ConnectionPool connectionPool = ConnectionPool.getInstance();


    @Override
    public Client signIn(String login, String password) throws DaoException {
        LOGGER.log(Level.DEBUG, "Client Dao: start SignIn");
        Connection connection = connectionPool.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        Client client = null;
        try {
            statement = connection.prepareStatement(FIND_BY_LOGIN_AND_PASSWORD);
            statement.setString(1, login);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.first()) {
                client = new Client();
                client.setIdUser(resultSet.getInt("user_iduser"));
                client.setLogin(resultSet.getString("user.login"));
                client.setPassword(resultSet.getString("user.password"));
                client.setName(resultSet.getString("name"));
                client.setSurname(resultSet.getString("surname"));
                client.setEmail(resultSet.getString("email"));
                client.setPoint(resultSet.getDouble("point"));
                client.setBan(resultSet.getBoolean("ban"));
                client.setRole(resultSet.getBoolean("user.role"));
            }
        } catch (SQLException e) {
            throw new DaoException("Exception while executing SQL query", e);
        } finally {
            connectionPool.putBack(connection, resultSet, statement);
        }
        LOGGER.log(Level.DEBUG, "Client Dao: finish SignIn");
        return client;
    }

    @Override
    public Client findClientByLogin(String login) throws DaoException {
        Connection connection = connectionPool.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        Client client = null;
        try {
            statement = connection.prepareStatement(FIND_BY_LOGIN);
            statement.setString(1, login);
            resultSet = statement.executeQuery();
            if (resultSet.first()) {
                client = new Client();
                client.setIdUser(resultSet.getInt("user_iduser"));
                client.setLogin(resultSet.getString("user.login"));
                client.setPassword(resultSet.getString("user.password"));
                client.setName(resultSet.getString("name"));
                client.setSurname(resultSet.getString("surname"));
                client.setEmail(resultSet.getString("email"));
                client.setPoint(resultSet.getDouble("point"));
                client.setBan(resultSet.getBoolean("ban"));
                client.setRole(resultSet.getBoolean("user.role"));
            }
        } catch (SQLException e) {
            throw new DaoException("Exception while executing SQL query", e);
        } finally {
            connectionPool.putBack(connection, resultSet, statement);
        }
        return client;
    }

    @Override
    public boolean findClientByEmail(String email) throws DaoException {
        LOGGER.log(Level.DEBUG, "Client DAO: start findClientByEmail");

        Connection connection = connectionPool.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(FIND_BY_EMAIL);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            if (resultSet.first()) {
                return true;
            }
        } catch (SQLException e) {
            throw new DaoException("Exception while executing SQL query", e);
        } finally {
            connectionPool.putBack(connection, resultSet, statement);
        }
        LOGGER.log(Level.DEBUG, "Client DAO: finish findClientByEmail");
        return false;
    }

    @Override
    public boolean addUser(String login, String password) throws DaoException {
        Connection connection = connectionPool.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        LOGGER.log(Level.DEBUG, "Client DAO: start addUser");
        try {
            statement = connection.prepareStatement(ADD_USER);
            statement.setString(1, login);
            statement.setString(2, password);
            statement.setInt(3, 0);
            if (statement.executeUpdate() != 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new DaoException("Exception while user executing SQL query", e);
        } finally {
            LOGGER.log(Level.DEBUG, "Client DAO: finish addUser");
            connectionPool.putBack(connection, resultSet, statement);
        }
        return false;
    }

    @Override
    public Client addClient(String login,String name, String surname, String email) throws DaoException {
        Connection connection = connectionPool.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        LOGGER.log(Level.DEBUG, "Client DAO: start addClient");
        try {
            statement = connection.prepareStatement(ADD_CLIENT);
            statement.setString(1, name);
            statement.setString(2, surname);
            statement.setString(3, email);
            if (statement.executeUpdate() != 0) {
                return findClientByLogin(login);
            }
        } catch (SQLException e) {
            throw new DaoException("Exception while client executing SQL query", e);
        } finally {
            LOGGER.log(Level.DEBUG, "Client DAO: finish addClient");
            connectionPool.putBack(connection, resultSet, statement);
        }
        return null;
    }


    @Override
    public void close(ResultSet resultSet, Statement statement) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
