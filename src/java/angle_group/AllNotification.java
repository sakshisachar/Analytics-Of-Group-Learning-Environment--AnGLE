/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

import bean.Notification;
import bean.Person;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import utilities.Utility;

/**
 *
 * @author pratik
 */
public class AllNotification extends ActionSupport {
    ArrayList<Notification> allNotifications = new ArrayList<Notification>();

    public ArrayList<Notification> getAllNotifications() {
        return allNotifications;
    }

    public void setAllNotifications(ArrayList<Notification> allNotifications) {
        this.allNotifications = allNotifications;
    }

    @Override
    public String execute() {
        AngleUtility util = new AngleUtility();

        HttpSession session = ServletActionContext.getRequest().getSession();
        Person person = (Person) session.getAttribute(Utility.USER_HANDLE);

        allNotifications = util.getNotificationForUser(person.getLoginId());
        return Utility.SUCCESS;
    }
}
