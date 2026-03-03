module ExempleJavaFX_SENSE_FXML {
    requires javafx.controls;
    requires javafx.fxml;

    opens hellofx to javafx.graphics;
    exports paquete;
}