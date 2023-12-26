package chap04.servlet;

import java.util.ArrayList;
import java.util.List;

public class UserDataManager {
	//등록유저
    private static List<User> registeredUsers = new ArrayList<>();

    public static List<User> getRegisteredUsers() {
        return registeredUsers;
    }

    public static void addUser(User user) {
        registeredUsers.add(user);
    }
}
