# MOB21_22_Fatima_Michel_Runaway

## Allgemein
Runaway App von Fatima & Michel. Ermöglicht es Herauszufinden wann es an deinem Standort regnet, und zeigt den nähesten Ort an, in dem es nicht regnet.
Das Projekt wird in Flutter realisiert. Es wurde ein Coding Style definiert (Coding.md) um einen gmeinsamen Stil zu definieren. 

# Quickstart-Guide:
1. Ladeseite
2. Login-Seite mit Email und Passwort, Google-Sign-In, Anonymes Login, Registrierung
    2.1 Registrierungsseite
3. Startseite mit derzeitigem Standort und Orte mit besserem Wetter in der Umgebung (können mit Klick auf das Herz zu Favoriten hinzugefügt werden)
    3.1 Bei Klick auf anderen Ort öffnet sich Übersichtsseite des Ortes (Wie weit ist dieser entfernt, etc.)
4. Falls Favorit hinzugefügt wird auf "My Locations" dieser Ort in einer Liste festgehalten.
5. In den Settings kann die Sprache eingestellt werden und in welcher Einheit die Temperatur angezeigt werden soll
6. Logout

# Übersicht über Code-Aufbau:
Wir haben unseren Code in mehrere Ordner unterteilt.
Zuerst haben wir einen Logic-Ordner, welcher die Logik des Codes hält. Beispielsweise die Authentication und den Screen-Size-Calculator.
Danach hält ein Ordner die ganzen Pages, darunter gibt es noch mehr Ordner, wie Favorites, Login, Menu, Place, Register und Settings.
Als letztes gibt es noch den Ordner Widgets mit dem Unterordner Sidebar.
Die main.dart ist außerhalb jeglicher Ordner.

