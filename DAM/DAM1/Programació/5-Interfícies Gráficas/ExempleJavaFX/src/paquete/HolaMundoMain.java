package paquete;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class HolaMundoMain extends Application {
	
    @Override
    public void start(Stage primaryStage) throws Exception {
        // Load the FXML file
        FXMLLoader loader = new FXMLLoader(getClass().getResource("holamundo.fxml"));
        Parent root = loader.load();

        // Create the scene with the loaded FXML root node
        Scene scene = new Scene(root);

        // Set the scene on the primary stage
        primaryStage.setScene(scene);
        primaryStage.setTitle("JavaFX FXML Example");
        primaryStage.show();
    }
    
    public static void main(String[] args) {
        launch(args);
    }
    
}
