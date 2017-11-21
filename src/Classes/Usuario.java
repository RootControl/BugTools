package Classes;

public class Usuario {
	String nome;
	String sobreNome;
	String ra;
	String email;
	String login;
	String senha;
	String tipoUsuario;
	String id;
	int sup;
	
	
	public Usuario (String id, String nome, String sobreNome, String ra, String email, String login, String senha, String tipoUsuario) {
		this.id = id;
		this.nome = nome;
		this.sobreNome = sobreNome;
		this.ra = ra;
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.tipoUsuario = tipoUsuario;
	}
	
	public Usuario() {
		
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSobreNome() {
		return sobreNome;
	}
	public void setSobreNome(String sobreNome) {
		this.sobreNome = sobreNome;
	}
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getSup() {
		return sup;
	}

	public void setSup(int sup) {
		this.sup = sup;
	}

	@Override
    public String toString() {
        return "Student{" + "RA = " + ra + ", name = " + nome + ", lastName = " + sobreNome + ", email = " + email +
        		 ", login = " + login + ", password = " + senha + "}"; 
    }
	
}
