/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.OrderDAO;
import dtos.AreaChartDTO;
import dtos.BarChartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DashBoardController", urlPatterns = {"/DashBoardController"})
public class DashBoardController extends HttpServlet {

    public String GetDate(int month, int day){
        String date="";
        switch(month) {
            case 1:
                date="Jan "+day;
                System.out.println(date);
                break;
            case 2:
                date="Feb "+day;
                System.out.println(date);
                break;
            case 3:
                date="Mar "+day;
                System.out.println(date);
                break;
            case 4:
                date="Apr "+day;
                System.out.println(date);
                break;
            case 5:
                date="May "+day;
                System.out.println(date);
                break;
            case 6:
                date="Jun "+day;
                System.out.println(date);
                break;
            case 7:
                date="Jul "+day;
                System.out.println(date);
                break;
            case 8:
                date="Aug "+day;
                System.out.println(date);
                break;
            case 9:
                date="Sep "+day;
                System.out.println(date);
                break;
            case 10:
                date="Oct "+day;
                System.out.println(date);
                break;
            case 11:
                date="Nov "+day;
                System.out.println(date);
                break;
            case 12:
                date="Dec "+day;
                System.out.println(date);
                break;
        };
        return date;
    }
    private static final String SUCCESS ="DashBoard.jsp";
    private static final String ERROR = "error.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            OrderDAO dao = new OrderDAO();
            int highestDailyRevenue=0;
            List<AreaChartDTO> areaList = new ArrayList<AreaChartDTO>();
            String date;
            for(int i=0; i<14; i++){
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, -13+i);
                
                int month=cal.getTime().getMonth()+1;
                int day=cal.getTime().getDate();
                
                System.out.println("Month = "+ month + " Day = " + day);
                date = GetDate(month, day);
                
                AreaChartDTO areaData = dao.getDailyRevenue(month, day);
                if (areaData==null){
                    AreaChartDTO noData = new AreaChartDTO();
                    noData.setRevenue(0);
                    areaData=noData;
                }
                areaData.setDate(date);
                if(highestDailyRevenue<areaData.getRevenue()) highestDailyRevenue=areaData.getRevenue();
                areaList.add(areaData);
            }
            
            int highestMonthlyRevenue=0;
            List<BarChartDTO> list = new ArrayList<BarChartDTO>();
            for (int i=0; i<12; i++){
                BarChartDTO data = dao.getMonthlyRevenue(i+1);
                if (data==null){
                    BarChartDTO noData=new BarChartDTO();
                    noData.setRevenue(0);
                    noData.setMonth(i+1);
                    data=noData;
                }
                if(highestMonthlyRevenue<data.getRevenue()) highestMonthlyRevenue=data.getRevenue();
                list.add(data);
            }
            if(list != null && areaList != null){
                System.out.println("Monthly revenue");
                for (int i=0; i<12;i++){
                    System.out.println("Revenue: " + list.get(i).getRevenue() + " Month: " + (i+1));
                }
                System.out.println("Daily revenue");
                for (int i=0; i<14;i++){
                    System.out.println("Revenue: " + areaList.get(i).getRevenue() + " Date: " + areaList.get(i).getDate());
                }
                
                request.setAttribute("highestDaily", highestDailyRevenue);
                request.setAttribute("highestMonthly", highestMonthlyRevenue);
                request.setAttribute("AreaChart", areaList);
                request.setAttribute("BarChart", list);
                url=SUCCESS;
            }
        } catch (Exception e) {
        } finally{
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
