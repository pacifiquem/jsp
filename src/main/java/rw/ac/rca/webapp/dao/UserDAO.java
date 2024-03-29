/**
 *
 */
package rw.ac.rca.webapp.dao;

import java.util.List;

import rw.ac.rca.webapp.orm.User;
import rw.ac.rca.webapp.util.UserRole;

/**
 * @author Aphrodice Rwagaju
 *
 */
public interface UserDAO {

    public User saveUser(User user);

    public User updateUser(User user);

    public User saveOrUpdateUser(User user);

    public boolean deleteUser(int id);

    public User getUserById(int userId);

    public User getUserByEmailAddress(String emailAddress);

    public List<User> getAllUsers();

    public User getUserByUsername(String username);

    public List<User> getUserByFullName(String fullName);

    public User getUserByUserNameAndPassword(String username, String password);

    public User getUserByDetails(String username, String email, String password);

    public List<User> getUserByUserRoleAndApprovalStatus(UserRole userRole);

}
