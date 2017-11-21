package Controle;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import Classes.Problema;
import Classes.Usuario;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class AnchorPaneTelaSuporteControle implements Initializable {
	@FXML
	private TableView<Problema> tableView;
	@FXML
	private TableColumn<Problema, String> tableColumnId;
	@FXML
	private TableColumn<Problema, String> tableColumnTipo;
	@FXML
	private TableColumn<Problema, String> tableColumnData;
	@FXML
	private TableColumn<Problema, String> tableColumnDescricao;
	@FXML
	private Button buttonDetalhes;
	@FXML
	private Button buttonResolvidos;
	@FXML
	private Button buttonRelatorio;
	@FXML
	private Button buttonProblemas;
	@FXML
	private Button buttonSair;

	private BancoDeDados bd;
	private ObservableList<Problema> obsList;
	private ArrayList<Problema> probList;
	public String login;
	public String senha;

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

		mostrarTabelaProblemas();

	}

	public void mostrarTabelaProblemas() {
		this.probList = this.bd.all();

		this.tableColumnId.setCellValueFactory(new PropertyValueFactory<>("Id"));
		this.tableColumnTipo.setCellValueFactory(new PropertyValueFactory<>("Tipo"));
		this.tableColumnData.setCellValueFactory(new PropertyValueFactory<>("Data"));
		this.tableColumnDescricao.setCellValueFactory(new PropertyValueFactory<>("Descricao"));

		this.obsList = FXCollections.observableArrayList(this.probList);
		this.tableView.setItems(this.obsList);
	}

	public void mostrarTabelaResolvidos() {
		this.probList = this.bd.resolvidos();

		this.tableColumnId.setCellValueFactory(new PropertyValueFactory<>("Id"));
		this.tableColumnTipo.setCellValueFactory(new PropertyValueFactory<>("Tipo"));
		this.tableColumnData.setCellValueFactory(new PropertyValueFactory<>("Data"));
		this.tableColumnDescricao.setCellValueFactory(new PropertyValueFactory<>("Descricao"));

		this.obsList = FXCollections.observableArrayList(this.probList);
		this.tableView.setItems(this.obsList);
	}

	@FXML
	public void handleButtonDetalhes() throws IOException {
		Problema prob = this.tableView.getSelectionModel().getSelectedItem();
		Usuario usuario = new Usuario();

		usuario.setLogin(this.getLogin());
		usuario.setSenha(this.getSenha());

		this.bd.fazerLogin(usuario);

		if (prob == null) {
			Alert errorAlert = new Alert(Alert.AlertType.ERROR);
			errorAlert.setContentText("Por favor, escolha um problema na tabela!");
			errorAlert.show();
		}
		else {
			boolean buttonConfirmarClicked = telaDetalhes(prob);

			if (buttonConfirmarClicked) {
				this.bd.problemaResolvido(usuario, prob);

				Alert confirmationAlert = new Alert(Alert.AlertType.CONFIRMATION);
				confirmationAlert.setHeaderText("Atualiza��o concluida.");
				confirmationAlert.setContentText("O problema foi enviado para a tabela Resolvidos.");

				confirmationAlert.show();

				mostrarTabelaProblemas();
			}
		}
	}

	@FXML
	public void handleButtonResolvidos() {
		mostrarTabelaResolvidos();
	}

	@FXML
	public void handleButtonProlemas() {
		mostrarTabelaProblemas();
	}

	@FXML
	public void handleButtonRelatorios() throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(AnchorPaneRelatoriosControle.class.getResource("/Janelas/AnchorPaneRelatorios.fxml"));
		AnchorPane page = (AnchorPane) loader.load();

		Stage dialogStage = new Stage();
		dialogStage.setTitle("Relat�rio");
		Scene scene = new Scene(page);
		dialogStage.setScene(scene);

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

	public boolean telaDetalhes(Problema problema) throws IOException {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(AnchorPaneTelaSuporteControle.class.getResource("/Janelas/AnchorPaneTelaDetalhes.fxml"));
		AnchorPane page = (AnchorPane) loader.load();

		Stage dialogStage = new Stage();
		dialogStage.setTitle("Detalhes do Problema");
		Scene scene = new Scene(page);
		dialogStage.setScene(scene);

		AnchorPaneTelaDetalhesControle controller = loader.getController();
		controller.setDialogStage(dialogStage);
		controller.setProblema(problema);

		dialogStage.showAndWait();

		return controller.isButtonConfirmarClicked();
	}
}
