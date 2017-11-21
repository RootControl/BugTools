package Controle;

import java.net.URL;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class AnchorPaneAlterarEmailControle implements Initializable{
	@FXML
	private TextField textFieldEmailAtual;
	@FXML
	private AnchorPane anchorPane;
	@FXML
	private TextField textFieldNovoEmail;
	@FXML
	private Button buttonSalvar;
	@FXML
	private Button buttonCancelar;

	private Stage dialogStage;
	private BancoDeDados bd;
	private String idPessoa;
	private String emailAtual;
	private String emailNovo;

	public String getEmailAtual() {
		return emailAtual;
	}

	public void setEmailAtual(String emailAtual) {
		this.emailAtual = emailAtual;
	}

	public String getEmailNovo() {
		return emailNovo;
	}

	public void setEmailNovo(String emailNovo) {
		this.emailNovo = emailNovo;
	}

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

	}

	@FXML
	public void handleButtonSalvar() {

		this.setEmailAtual(this.textFieldEmailAtual.getText().toString());
		this.setEmailNovo(this.textFieldNovoEmail.getText().toString());

		bd.alterarEmail(this.getEmailAtual(), this.getEmailNovo());
		this.getDialogStage().close();
	}

	@FXML
	public void handleButtonCancelar() {
		this.getDialogStage().close();
	}
}
