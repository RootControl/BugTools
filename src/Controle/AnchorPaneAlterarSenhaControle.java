package Controle;

import java.net.URL;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.stage.Stage;

public class AnchorPaneAlterarSenhaControle implements Initializable{
	@FXML
	private PasswordField senhaAtual;
	@FXML
	private PasswordField senhaNova;
	@FXML
	private Button buttonSalvar;
	@FXML
	private Button buttonCancelar;

	private Stage dialogStage;
	private String idPessoa;
	BancoDeDados bd;

	public String getIdPessoa() {
		return idPessoa;
	}

	public void setIdPessoa(String idPessoa) {
		this.idPessoa = idPessoa;
	}

	public Stage getDialogStage() {
		return dialogStage;
	}

	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		bd = new BancoDeDados();
	}

	@FXML
	public void handleButtonSalvar() {
		bd.alterarEmail(this.senhaAtual.getText(), this.senhaNova.getText());
		this.getDialogStage().close();
	}

	@FXML
	public void handleButtonCancelar() {
		this.getDialogStage().close();
	}
}
