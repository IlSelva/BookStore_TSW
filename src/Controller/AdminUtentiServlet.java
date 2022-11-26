package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import Model.Utente;
import Model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminUtenti")
public class AdminUtentiServlet extends HttpServlet {
	private final UtenteDAO utenteDAO = new UtenteDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente utente = (Utente) request.getSession().getAttribute("utente"); // prendo l'utente dalla sessione
        if (utente == null || !utente.isAdmin()) //controllo che l'utente sia amministratore
            throw new MyServletException();

        String address = "WEB-INF/jsp/adminUtenti.jsp";
        String idstr = request.getParameter("id");
        if(idstr == null) {
            List<Utente> utenti = utenteDAO.doRetrieveAll(0, 10); // carico tutti gli utenti dal DB e li mando alla jsp
            request.setAttribute("utenti", utenti);
        } else{
            int id = Integer.parseInt(idstr);
            if(request.getParameter("rimuovi") != null){ //elimina utente
                utenteDAO.doDelete(id);
                request.setAttribute("notifica", "Utente RIMOSSO con successo");
            } else {
                String nome = request.getParameter("nome");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String admin = request.getParameter("admin");
                if ((nome != null) && (email != null)) {
                    Utente u = utenteDAO.doRetrieveById(id);
                    u.setNome(nome);
                    u.setEmail(email);
                    if((password != null) || (password.compareTo("") != 0))
                        u.setPassword(password);
                    if(admin != null)
                        u.setAdmin(true);
                    else
                        u.setAdmin(false);
                    utenteDAO.doUpdate(u);
                    request.setAttribute("notifica", "Utente Modificato con successo");
                    List<Utente> utenti = utenteDAO.doRetrieveAll(0, 10); // carico tutti gli utenti dal DB e li mando alla jsp
                    request.setAttribute("utenti", utenti);
                } else {
                    Utente u = utenteDAO.doRetrieveById(id);
                    request.setAttribute("cliente", u);
                    address = "WEB-INF/jsp/modificaUtente.jsp";
                }
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }
}
