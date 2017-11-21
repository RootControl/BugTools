package Classes;

public class Relatorio {

	private String sala,
				   pc,
				   tipo,
				   descricao,
				   nome,
				   ra,
				   email;

	public String getSala() {
		return sala;
	}

	public void setSala(String sala) {
		this.sala = sala;
	}

	public String getIdMaquina() {
		return pc;
	}

	public void setIdMaquina(String idMaquina) {
		this.pc = idMaquina;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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
	
	public Relatorio (String sala, String idMaquina, String tipo, String descricao, String nome, String ra, String email) {
		this.sala = sala;
		this.pc = idMaquina;
		this.tipo= tipo;
		this.descricao = descricao;
		this.nome= nome;
		this.ra = ra;
		this.email = email;
	}
}
