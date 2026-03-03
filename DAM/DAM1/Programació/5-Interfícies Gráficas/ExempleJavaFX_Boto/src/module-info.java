module ExempleJavaFX_Boto {
    requires javafx.controls;
    requires javafx.fxml;

    opens paquete to javafx.fxml;

    exports paquete;
}