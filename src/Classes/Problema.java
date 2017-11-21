package Classes;

public class Problema {
	String id;
	String tipo;
	String data;
	String descricao;
	String sala;
	Integer pc;
	String status;
	
	public Problema (String id, String sala, Integer pc, String data, String tipo, String descricao, String status) {
		this.id = id;
		this.tipo = tipo;
		this.data = data;
		this.descricao = descricao;
		this.sala = sala;
		this.pc = pc;
		this.status = status;
	}
	
	public Problema () {
		
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
	
	
    public String getSala() {
		return sala;
	}

	public void setSala(String sala) {
		this.sala = sala;
	}

	public Integer getPc() {
		return pc;
	}

	public void setPc(Integer pc) {
		this.pc = pc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void printProblema() {
         System.out.println("Problema{" + "ID = " + id + ", Tipo = " + tipo + ", Data = " + data + ", Descricão = " + descricao + ", Sala = " + sala + ", PC = " + pc + ", Status = " + status + "}"); 
    }
}
