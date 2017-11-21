package Controle;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import Classes.Problema;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class AnchorPaneCadastroProblema implements Initializable{

	@FXML
	private TextField textFieldNumLab;
	@FXML
	private TextField textFieldNumPC;
	@FXML
	private ChoiceBox<String> choiceBoxTipo;
	@FXML
	private TextArea textAreaDescricao;
	@FXML
	private Button buttonAlterarEmail;
	@FXML
	private Button buttonAlterarSenha;
	@FXML
	private Button buttonSalvar;
	@FXML
	private Button buttonLimpar;
	@FXML
	private Button buttonSair;

	private BancoDeDados bd;
	private ObservableList<String> choiceBoxList = FXCollections.observableArrayList("Mouse", "CPU", "Monitor", "Teclado", "Software", "Outros");
	private String val;
	private String idPessoa;


	public String getIdPessoa() {
		return idPessoa;
	}

	public void setIdPessoa(String idPessoa) {
		this.idPessoa = idPessoa;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		bd = new BancoDeDados();
		this.choiceBoxTipo.setValue("Mouse");
		this.choiceBoxTipo.setItems(choiceBoxList);
	}

	@FXML
	public void handleButtonSalvar() throws SQLException {
		Problema problema = new Problema();

		problema.setSala(this.textFieldNumLab.getText().toString());
		String tmp = this.textFieldNumPC.getText();

		problema.setPc(Integer.parseInt(tmp));
		this.setVal(this.choiceBoxTipo.getValue().toString());
		problema.setDescricao(this.textAreaDescricao.getText().toString());

		if (this.getVal().equals("Mouse")) {
			problema.setTipo("1");
		}
		else if (this.getVal().equals("CPU")) {
			problema.setTipo("2");
		}
		else if (this.getVal().equals("Monitor")) {
			problema.setTipo("3");
		}
		else if (this.getVal().equals("Teclado")) {
			problema.setTipo("4");
		}
		else if (this.getVal().equals("Software")) {
			problema.setTipo("5");
		}
		else if (this.getVal().equals("Outros")) {
			problema.setTipo("6");
		}

		this.bd.salvarProblema(problema, idPessoa);

		Alert confirmationAlert = new Alert(Alert.AlertType.CONFIRMATION);
		confirmationAlert.setHeaderText("Problema enviado.");
		confirmationAlert.setContentText("Seu problema foi enviado para a equipe de Suporte.");
		confirmationAlert.show();

		handleButtonLimpar();
	}

	@FXML
	public void handleButtonLimpar() {
		this.textFieldNumLab.setText("");
		this.textFieldNumPC.setText("");
		this.textAreaDescricao.setText("");
		this.choiceBoxTipo.setValue("Mouse");



	}

	@FXML
	public void handleButtonAlterarEmail() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(AnchorPaneCadastroProblema.class.getResource("/Janelas/AnchorPaneAlterarEmail.fxml"));
		AnchorPane page = (AnchorPane) loader.load();

		Stage dialogStage = new Stage();
		dialogStage.setTitle("Alterar Email");
		Scene scene = new Scene(page);
		dialogStage.setScene(scene);

		AnchorPaneAlterarEmailControle controller = loader.getController();
		controller.setDialogStage(dialogStage);
		controller.setIdPessoa(this.idPessoa);

		dialogStage.showAndWait();

	}

	@FXML
	public void handleButtonAlterarSenha() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(AnchorPaneAlterarSenhaControle.class.getResource("/Janelas/AnchorPaneAlterarSenha.fxml"));
		AnchorPane page = (AnchorPane) loader.load();

		Stage dialogStage = new Stage();
		dialogStage.setTitle("Alterar Senha");
		Scene scene = new Scene(page);
		dialogStage.setScene(scene);

		AnchorPaneAlterarSenhaControle controller = loader.getController();
		controller.setDialogStage(dialogStage);
		controller.setIdPessoa(this.idPessoa);

		dialogStage.showAndWait();

	}

	@FXML
	public void handleButtonSair() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(VBoxTelaInicialControle.class.getResource("/Janelas/VBoxTelaInicial.fxml"));
		Parent janela = (Parent) loader.load();

		Stage dialogStage = new Stage();
		dialogStage.setTitle("Problemas");
		Scene scene = new Scene(janela);
		dialogStage.setScene(scene);

		dialogStage.show();

		Stage stage = (Stage) buttonSair.getScene().getWindow();
	    stage.close();
	}

}
