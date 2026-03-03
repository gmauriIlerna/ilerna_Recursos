package paquete;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class HolaMundoController {
	
	@FXML
	private Button exit;
	
    @FXML
    private void exit() {
        Stage stage = (Stage) exit.getScene().getWindow();
        stage.close();
    }

}
