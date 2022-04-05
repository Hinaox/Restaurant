/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdditionParTable;
import model.Commande;
import model.DetailsCommande;
import model.Plat;
import model.Tables;
import services.CommandeService;
import services.PlatService;

/**
 *
 * @author amboa
 */
@WebServlet(name = "AdditionController", urlPatterns = {"/Addition"})
public class AdditionController extends HttpServlet {

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
        RequestDispatcher dispat = request.getRequestDispatcher("facture.jsp");
        String numTable = "all";
        if(request.getParameter("numTable")!= null)
        numTable = request.getParameter("numTable");
        Vector<AdditionParTable> listeCommande = CommandeService.getAddition(numTable);
        HashMap<String, Vector<DetailsCommande>> listeDetailsCommande = new HashMap();
        for(AdditionParTable a: listeCommande) {
            listeDetailsCommande.put(a.getIdCommande(), CommandeService.getDetailsCommande(a.getIdCommande()));
        }
        HashMap<String, Plat> listePlat = PlatService.listePlatParId();
        Vector<Tables> listeTables = CommandeService.getTables();
        request.setAttribute("listeAddition", listeCommande);
        request.setAttribute("listeDetailsCommande", listeDetailsCommande);
        request.setAttribute("listePlat", listePlat);
        request.setAttribute("listeTables", listeTables);
        dispat.forward(request, response);
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
