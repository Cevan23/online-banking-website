package controller.AdminDashboard;

import business.Customer;
import DAO.CustomerDAO;
import Exception.HandleException;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/admin-dashboard/customer")
public class CustomerServlet extends HttpServlet {

    CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // default action
        }

        String url = "/admin-dashboard/";
        switch (action) {
            case "add-customer" -> {
                this.addCustomer(request, response);
                this.showCustomer(request, response);
            }
            default -> {
            }
        }
        url = "/admin-dashboard/customer.jsp";
        servletContext.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext servletContext = getServletContext();

        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // default action
        }

        String url = "/admin-dashboard/";
        switch (action) {
            case "show-customer" -> this.showCustomer(request, response);
            default -> {
            }
        }
        url = "/admin-dashboard/customer.jsp";
        servletContext.getRequestDispatcher(url).forward(request, response);
    }

    protected void showCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> customers = customerDAO.findAllCustomer();

        request.setAttribute("customers", customers);

    }

    protected void addCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String fullName = request.getParameter("name");
        String citizenId = request.getParameter("citizenId");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String password = request.getParameter("password");
        int pinNumber = Integer.parseInt(request.getParameter("pinNumber"));
        try {
            customerDAO.customerSignup(fullName, email, password, citizenId, phoneNumber, dateOfBirth, address,
                    pinNumber);
            request.setAttribute("successMessage", "The customer has been added successfully.");

        } catch (HandleException e) {
            request.setAttribute("errorMessage", e.getMessage());
        }
    }

}