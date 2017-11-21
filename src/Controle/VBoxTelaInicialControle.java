package Controle;

import java.io.IOException;
import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import Classes.Usuario;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
//import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class VBoxTelaInicialControle implements Initializable {
	@FXML
	private TextField textFieldLogin;
	@FXML
	private TextField textFieldSenha;
	@FXML
	private TextField textFieldCadNome;
	@FXML
	private TextField textFieldCadSobrenome;
	@FXML
	private TextField textFieldCadRA;
	@FXML
	private TextField textFieldCadEmail;
	@FXML
	private TextField textFieldCadLogin;
	@FXML
	private TextField textFieldCadSenha;
	@FXML
	private Button buttonEntrar;
	@FXML
	private Button buttonCadastrar;
	@FXML
	private AnchorPane anchorPane;
	@FXML
	private VBox vbox;

	private BancoDeDados bd;

	public String login;
	public String senha;
	public String idPessoa;


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

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		this.bd = new BancoDeDados();
	}

	@FXML
	public void handleButtonCadastrar() throws IOException {
		Usuario usuario = new Usuario();

		usuario.setRa(this.textFieldCadRA.getText());
		usuario.setNome(this.textFieldCadNome.getText());
		usuario.setSobreNome(this.textFieldCadSobrenome.getText());
		usuario.setEmail(this.textFieldCadEmail.getText());
		usuario.setLogin(this.textFieldCadLogin.getText());
		usuario.setSenha(this.textFieldCadSenha.getText());
		usuario.setTipoUsuario("Aluno");

		Alert confirmationAlert = new Alert(Alert.AlertType.CONFIRMATION);
		confirmationAlert.setHeaderText("Deseja realmente criar uma conta?");
		confirmationAlert.setContentText("Agora � s� inserir seu login e senha para informar o problema.");

		Optional<ButtonType> result = confirmationAlert.showAndWait();
		if (result.get() == ButtonType.OK) {
			this.bd.registrarUsuario(usuario);

			textFieldCadNome.setText("");
			textFieldCadSobrenome.setText("");
			textFieldCadRA.setText("");
			textFieldCadEmail.setText("");
			textFieldCadLogin.setText("");
			textFieldCadSenha.setText("");
		}
	}

	@FXML
	public void handleButtonEntrar() throws IOException {
		Usuario usuario = new Usuario();

		usuario.setLogin(this.textFieldLogin.getText());
		usuario.setSenha(this.textFieldSenha.getText());

		this.setLogin(this.textFieldLogin.getText());
		this.setSenha(this.textFieldSenha.getText());


		this.bd.fazerLogin(usuario);

		idPessoa = usuario.getId();
		System.out.println(idPessoa);


		if (usuario.getId() != null) {

			if(usuario.getSup() == 1) {
				FXMLLoader loader = new FXMLLoader();
				loader.setLocation(AnchorPaneTelaSuporteControle.class.getResource("/Janelas/AnchorPaneTelaSuporte.fxml"));
				AnchorPane janela = (AnchorPane) loader.load();

				Stage dialogStage = new Stage();
				dialogStage.setTitle("Problemas");
				Scene scene = new Scene(janela);
				dialogStage.setScene(scene);

				dialogStage.show();

				AnchorPaneTelaSuporteControle controller = loader.getController();
				controller.setLogin(this.getLogin());
				controller.setSenha(this.getSenha());

				Stage stage = (Stage) buttonEntrar.getScene().getWindow();
			    stage.close();
			}
			else {
				FXMLLoader loader = new FXMLLoader();
				loader.setLocation(AnchorPaneCadastroProblema.class.getResource("/Janelas/AnchorPaneTelaCadastroProblema.fxml"));
				AnchorPane janela = (AnchorPane) loader.load();

				Stage dialogStage = new Stage();
				dialogStage.setTitle("Cadastro de Problemas");
				Scene scene = new Scene(janela);
				dialogStage.setScene(scene);

				dialogStage.show();

				AnchorPaneCadastroProblema controller = loader.getController();
				controller.setIdPessoa(usuario.getId());


				Stage stage = (Stage) buttonEntrar.getScene().getWindow();
			    stage.close();
			}
		}
		else {
			Alert errorAlert = new Alert(Alert.AlertType.ERROR);
			errorAlert.setContentText("Login ou Senha incorretos!");
			errorAlert.show();
		}
	}
}
