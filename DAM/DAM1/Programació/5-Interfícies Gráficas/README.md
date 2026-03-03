# Ilerna_Recursos_Prog

Recursos DAM/DAW Programació

------------------------------------------------------------------------

Aquest repositori conté exemples de **JavaFX** pensats per executar-se
amb **Eclipse** i **projectes modulars** (amb `module-info.java`).

------------------------------------------------------------------------

## Requisits previs

-   **JDK** instal·lat (recomanat **JDK 17 o 21**).
-   **Eclipse IDE for Java Developers** (o similar).
-   **JavaFX SDK** (Gluon).

> Important: JavaFX **no ve inclòs** al JDK. Cal baixar-lo a part.

------------------------------------------------------------------------

## 1) Descarregar JavaFX SDK

1.  Ves a la pàgina de descàrrega de JavaFX (OpenJFX / Gluon).
2.  Baixa el **JavaFX SDK** que correspongui al teu sistema i
    arquitectura.
3.  Descomprimeix-lo en una ruta estable (evita espais i carpetes
    temporals), per exemple:

Windows: C:'\ruta-al-teu\javafx-sdk-XX'

Linux: /opt/javafx/javafx-sdk-XX

macOS: /Applications/javafx-sdk-XX

A dins hi ha d'haver la carpeta: .../javafx-sdk-XX/lib

------------------------------------------------------------------------

## 2) Crear la variable d'entorn JAVAFX_HOME (recomanat)

Defineix una variable d'entorn:

JAVAFX_HOME

Apuntant a la carpeta del SDK.

Windows: 1. Edit the system environment variables 2. Environment
Variables 3. Nova variable: - Nom: JAVAFX_HOME - Valor: ruta del JavaFX

Linux/macOS (bash o zsh):

export JAVAFX_HOME=/opt/javafx/javafx-sdk-XX

------------------------------------------------------------------------

## 3) Crear una User Library a Eclipse

1.  Window → Preferences
2.  Java → Build Path → User Libraries
3.  New → Nom: JavaFX
4.  Add External JARs
5.  Afegeix tots els .jar de: \${JAVAFX_HOME}/lib

------------------------------------------------------------------------

## 4) Crear o importar projecte

Crear nou: 1. File → New → Java Project 2. Tria JDK adequat. Marca
Create module-info.java

------------------------------------------------------------------------

## 5) Afegir JavaFX al ModulePath del projecte

1.  Clic dret projecte → Build Path
2.  Add Libraries
3.  User Library
4.  Selecciona JavaFX

------------------------------------------------------------------------

## 6) Configurar module-info.java

Exemple mínim:

```Java
module nom.del.teu.module { 
    requires javafx.controls; 
    requires javafx.fxml;
    opens nom.del.teu.package to javafx.fxml;
    exports nom.del.teu.package;
}
```

------------------------------------------------------------------------

## 7) Configurar Run Configuration

Run → Run Configurations → Arguments → VM arguments

Opció recomanada:

--module-path "\${env_var:JAVAFX_HOME}/lib" --add-modules
javafx.controls,javafx.fxml

Opció amb ruta directa (Windows):

--module-path "C:\ruta-al-teu\javafx-sdk-XX\lib"
--add-modules javafx.controls,javafx.fxml

Linux/macOS:

--module-path "/opt/javafx/javafx-sdk-XX/lib" --add-modules
javafx.controls,javafx.fxml

Apply → Run

------------------------------------------------------------------------

## Errors típics

JavaFX runtime components are missing\
→ Falta el module-path al Run.

module not found: javafx.controls\
→ No s'han afegit correctament els JARs.

Problemes amb FXML\
→ Revisa el opens al module-info i la ruta de getResource().

------------------------------------------------------------------------

## Recomanació final

-   Utilitza mateixa versió major de JDK i JavaFX (21 + 21).
-   Revisa sempre el Run Configuration si falla.
