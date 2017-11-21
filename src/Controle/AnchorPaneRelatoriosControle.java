package Controle;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import Classes.BancoDeDados;
import Classes.Relatorio;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

public class AnchorPaneRelatoriosControle implements Initializable {

	@FXML
	private TableView<Relatorio> tableView;
	@FXML
	private TableColumn<Relatorio, String> tableColumnSala;
	@FXML
	private TableColumn<Relatorio, String> tableColumnPC;
	@FXML
	private TableColumn<Relatorio, String> tableColumnTipo;
	@FXML
	private TableColumn<Relatorio, String> tableColumnDescricao;
	@FXML
	private TableColumn<Relatorio, String> tableColumnNome;
	@FXML
	private TableColumn<Relatorio, String> tableColumnRA;
	@FXML
	private TableColumn<Relatorio, String> tableColumnEmail;
	@FXML
	private Button buttonVoltar;

	private BancoDeDados bd;
	private ObservableList<Relatorio> obsList;
	private ArrayList<Relatorio> probList;
	private Stage dialogStage;


	public Stage getDialogStage() {
		return dialogStage;
	}

	public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}

	public void mostrarTabelaRelatario() {
		this.probList = this.bd.relatorio();

		this.tableColumnSala.setCellValueFactory(new PropertyValueFactory<>("Sala"));
		this.tableColumnPC.setCellValueFactory(new PropertyValueFactory<>("IdMaquina"));
		this.tableColumnTipo.setCellValueFactory(new PropertyValueFactory<>("Tipo"));
		this.tableColumnDescricao.setCellValueFactory(new PropertyValueFactory<>("Descricao"));
		this.tableColumnNome.setCellValueFactory(new PropertyValueFactory<>("Nome"));
		this.tableColumnRA.setCellValueFactory(new PropertyValueFactory<>("ra"));
		this.tableColumnEmail.setCellValueFactory(new PropertyValueFactory<>("Email"));

		this.obsList = FXCollections.observableArrayList(this.probList);
		this.tableView.setItems(this.obsList);
	}

	@FXML
	public void handleButtonVoltar() throws IOException {
		this.getDialogStage().close();
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		this.bd = new BancoDeDados();
		mostrarTabelaRelatario();		
	}
}
