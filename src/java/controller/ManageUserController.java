/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.UserDAO;
import dtos.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phath
 */
public class ManageUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String USER_LIST = "managerUserList.jsp";
    private static final String PROFILE = "managerUserDetail.jsp";
    private static final String ADMIN_LIST  = "AdminUserList.jsp";
    private static final String USER_UPDATE = "MainController?action=Manage+User&perform=Get+User&roleID=";
    private static final String UPDATE_FAIL = "MainController?action=Manage+User&perform=Profile&userID=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String perform = request.getParameter("perform");
        String roleID = request.getParameter("roleID");
        UserDAO dao = new UserDAO();
        String userID = request.getParameter("userID");
        UserDTO user = new UserDTO();
        List<UserDTO> list = new ArrayList<>();
        String url = ERROR;
        try {
            switch (perform) {
                case "Get User":
                   
                    list = dao.getUserList(roleID);
                    request.setAttribute("USER_LIST", list);
                    url = USER_LIST;
                    break;
                    
                case "Profile":
                    user = dao.getUserProfile(userID);
                    request.setAttribute("PROFILE", user);
                    url = PROFILE;
                    break;

                case "Status":
                    boolean status;
                    status = Boolean.parseBoolean(request.getParameter("status"));
                    boolean check = dao.manageStatus(userID, status);
                    if(check){
                        url = USER_UPDATE+roleID;
                        request.setAttribute("SUCCESS", "Update Success");                        
                    } else {
                        url = UPDATE_FAIL+userID;
                        request.setAttribute("FAILED", "Update Failed");
                    }
                 
                case "Get Manager":
                    list = dao.getAdminUserList();
                    request.setAttribute("USER_LIST", list);
                    url = ADMIN_LIST;
                    break;
                case "Add Manager":
                    
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String name= request.getParameter("name");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    
                    UserDTO manager = new UserDTO("", name, email, password, phone, address, "True", "MN");
                    dao.insertManager(manager);
                    url="MainController?action=Manage+User&perform=Get+Manager";
                    break;
                    
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
