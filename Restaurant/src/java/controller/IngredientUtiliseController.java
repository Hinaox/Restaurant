/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UtilisationIngredient;
import services.PlatService;

/**
 *
 * @author toavi
 */
@WebServlet(name = "IngredientUtiliseController", urlPatterns = {"/liste-ingredients-utilise"})
public class IngredientUtiliseController extends HttpServlet {

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
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date debut = new Date();
        Date fin = new Date();
        try{
            if(request.getParameter("dateDebut")!=null)
                debut = format.parse(request.getParameter("dateDebut"));
            if(request.getParameter("dateFin") != null)
                fin = format.parse(request.getParameter("dateFin"));
            List<UtilisationIngredient> listeIngredient = PlatService.getUtilisationIngredient(debut,fin);
            request.setAttribute("listeIngredients", listeIngredient);
            request.setAttribute("totalPrix", PlatService.totalPrix(listeIngredient));
            request.getRequestDispatcher("ingredient-utilise.jsp").forward(request, response);
        }catch(ParseException e){
            e.printStackTrace();
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
