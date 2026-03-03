module ExempleJavaFx_FXML {
	requires javafx.graphics;
	requires javafx.controls;
	requires javafx.fxml;

	opens paquete to javafx.fxml;

	exports paquete;
}