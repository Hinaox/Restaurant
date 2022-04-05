/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DetailsCommande;
import services.CommandeService;

/**
 *
 * @author amboa
 */
@WebServlet(name = "AjoutCommandeController", urlPatterns = {"/AjoutCommande"})
public class AjoutCommandeController extends HttpServlet {

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
        HttpSession session = request.getSession();
        ServletContext context = request.getServletContext();
        Vector<DetailsCommande> listeDetailsCommande = (Vector<DetailsCommande>) context.getAttribute("listeDetailsCommande");
        DetailsCommande d = new DetailsCommande();
        d.setIdCommande(session.getAttribute("idCommande").toString());
        d.setIdServeur(session.getAttribute("idServeur").toString());
        d.setIdPlat(request.getParameter("idPlat"));
        d.setPrix(Double.parseDouble(request.getParameter("prix")));
        if(listeDetailsCommande==null)
            listeDetailsCommande = new Vector();
        CommandeService.ajouterDetailsCommande(listeDetailsCommande, d);
        context.setAttribute("listeDetailsCommande", listeDetailsCommande);
        response.sendRedirect("liste-plat");
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
