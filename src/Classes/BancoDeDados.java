package Classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class BancoDeDados {
	private Connection conn;


    public BancoDeDados() {
        this.conn = getConnection();
    }

	public static Connection getConnection() {

		String url = "jdbc:mysql://localhost:3306/projeto";
		String user = "root";
		String password = "admin";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("Connect to database !!!");

		} catch (SQLException ex) {
			Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println("Not connect to database !!!");
		}

		return conn;
	}


    @Override
    public void finalize() {
        try {
            this.conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void alterarEmail(String email, String novoEmail) {
    	String query = "{CALL alter_email_log(?, ?)}";

    	try {
    		java.sql.CallableStatement cs = conn.prepareCall(query);
        	cs.setString(1, email);
        	cs.setString(2, novoEmail);

        	cs.executeQuery();
    	}
    	catch (SQLException ex) {
    		Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
    	}
    }

    public void salvarProblema(Problema problema, String idPessoa) throws SQLException {
    	String query = "{CALL Insere_problema(?, ?, ?, ?)}";

    	try {
    		java.sql.CallableStatement cs = conn.prepareCall(query);
        	cs.setString(1, problema.getTipo());
        	cs.setString(2, problema.getDescricao());
        	cs.setInt(3, problema.getPc());
        	cs.setString(4, idPessoa);

        	cs.executeQuery();
    	}
    	catch (SQLException ex) {
    		Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
    	}
    }

    public void registrarUsuario(Usuario usuario) {
    	String query = "{CALL Cria_Login_normal(?, ?, ?, ?, ?, ?, ?)}";

    	try {

    		java.sql.CallableStatement cs = conn.prepareCall(query);
        	cs.setString(1, usuario.getLogin());
        	cs.setString(2, usuario.getSenha());
        	cs.setString(3, usuario.getNome());
        	cs.setString(4, usuario.getSobreNome());
        	cs.setString(5, usuario.getRa());
        	cs.setString(6, usuario.getEmail());
        	cs.setString(7, usuario.getTipoUsuario());

        	cs.executeQuery();
    	} catch (SQLException ex) {
            Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void problemaResolvido(Usuario usuario, Problema prob) {
    	String query = "{CALL atualizar_resolvidos(?, ?, ?)}";

    	try {
    		java.sql.CallableStatement cs = conn.prepareCall(query);

    		cs.setString(1, prob.getId());
    		cs.setString(2, usuario.getId());
    		cs.setString(3, prob.getStatus());

    		cs.executeQuery();
    	} catch (SQLException ex) {
    		Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
    	}
    }

    public void fazerLogin(Usuario usuario) {

    	String query = "{CALL compare_login_teste(?, ?)}";

    	try {
    		java.sql.CallableStatement cs = conn.prepareCall(query);


    		cs.setString(1, usuario.getLogin());
    		cs.setString(2, usuario.getSenha());


    		ResultSet rs = cs.executeQuery();

    		if(rs.next()) {
    			String id = rs.getString(1);
    			int sup = rs.getInt(2);

    			usuario.setId(id);
    			usuario.setSup(sup);
    		}

    	} catch (SQLException ex) {
    		Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
    	}
    }


    public ArrayList<Problema> all() {
        ArrayList<Problema> list = new ArrayList<Problema>();

        String sql = "SELECT * FROM maquinas_nao_arrumadas";

        try {
            PreparedStatement stmt = this.conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	String id = rs.getString(1);
                String sala = rs.getString(2);
                Integer pc = rs.getInt(3);
                String data = rs.getString(4);
                String tipo = rs.getString(5);
                String descricao = rs.getString(6);
                String status = rs.getString(7);

                Problema prob = new Problema(id, sala, pc, data, tipo, descricao, status);

                list.add(prob);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<Relatorio> relatorio() {
        ArrayList<Relatorio> list = new ArrayList<Relatorio>();

        String sql = "SELECT * FROM problemas;";

        try {
            PreparedStatement stmt = this.conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String sala = rs.getString(1);
                String pc = rs.getString(2);
                String tipo = rs.getString(3);
                String descricao = rs.getString(4);
                String nome = rs.getString(5);
                String ra = rs.getString(6);
                String email = rs.getString(7);

                Relatorio prob = new Relatorio(sala, pc, tipo, descricao, nome, ra, email);

                list.add(prob);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<Problema> resolvidos() {
        ArrayList<Problema> list = new ArrayList<Problema>();

        String sql = "SELECT * FROM maquina_resolvida";

        try {
            PreparedStatement stmt = this.conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	String id = rs.getString(1);
                String sala = rs.getString(2);
                Integer pc = rs.getInt(3);
                String data = rs.getString(4);
                String tipo = rs.getString(5);
                String descricao = rs.getString(6);
                String status = rs.getString(7);

                Problema prob = new Problema(id, sala, pc, data, tipo, descricao, status);

                list.add(prob);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BancoDeDados.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
