package Controle;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import Classes.Problema;
import Classes.Usuario;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

public class AnchorPaneTelaDetalhesControle implements Initializable{
	@FXML
	private Label labelSala;
	@FXML
	private Label labelPC;
	@FXML
	private Label labelData;
	@FXML
	private Label labelTipo;
	@FXML
	private TextArea textAreaDescricao;
	@FXML
	private Button buttonResolvido;
	@FXML
	private Button buttonCancelar;
	
	
	private Stage dialogStage;
	private boolean buttonConfirmarClicked = false;
	private Problema problema;
	private ArrayList<Usuario> usuario;
	
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
				
	}

	public Stage getDialogStage() {
		return dialogStage;
	}


	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}


	public boolean isButtonConfirmarClicked() {
		return buttonConfirmarClicked;
	}


	public void setButtonConfirmarClicked(boolean buttonConfirmarClicked) {
		this.buttonConfirmarClicked = buttonConfirmarClicked;
	}


	public Problema getProblema() {
		return problema;
	}


	public void setProblema(Problema problema) {
		this.problema = problema;
		
		this.labelSala.setText(problema.getSala());
		this.labelPC.setText(problema.getPc().toString());
		this.labelData.setText(problema.getData());
		this.labelTipo.setText(problema.getTipo());
		this.textAreaDescricao.setText(problema.getDescricao());
	}
	
	public ArrayList<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(ArrayList<Usuario> usuario) {
		this.usuario = usuario;
	}

	@FXML
	public void handleButtonCancelar() {
		this.setButtonConfirmarClicked(false);
		this.dialogStage.close();
	}
	
	@FXML
	public void handleButtonResolvido() {
		this.setButtonConfirmarClicked(true);
		this.dialogStage.close();
	}
}
