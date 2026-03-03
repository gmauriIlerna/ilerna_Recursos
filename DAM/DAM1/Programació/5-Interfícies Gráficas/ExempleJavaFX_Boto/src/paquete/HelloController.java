package paquete;

import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class HelloController {

    @FXML
    private Label messageLabel;

    private int clickCount = 0;

    @FXML
    private void botonClick() {
        clickCount++;
        messageLabel.setText("Has hecho click: " + clickCount);
    }
}