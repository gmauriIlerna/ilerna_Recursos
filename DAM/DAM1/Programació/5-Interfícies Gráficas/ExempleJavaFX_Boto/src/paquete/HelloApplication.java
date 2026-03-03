package paquete;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class HelloApplication extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        FXMLLoader loader = new FXMLLoader(HelloApplication.class.getResource("MainView.fxml"));

        Scene scene = new Scene(loader.load(), 400, 300);

        stage.setTitle("Contador de Clicks");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}