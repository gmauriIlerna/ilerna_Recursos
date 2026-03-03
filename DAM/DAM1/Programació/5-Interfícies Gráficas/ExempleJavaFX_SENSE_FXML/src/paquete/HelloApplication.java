package hellofx;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class HelloApplication extends Application {

    @Override
    public void start(Stage stage) {
        Label label = new Label("Hola, JavaFX!");

        StackPane root = new StackPane(label);

        Scene scene = new Scene(root, 400, 300);

        stage.setTitle("HelloFX");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}