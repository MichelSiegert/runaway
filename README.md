# MOB21_22_Fatima_Michel_Runaway

## Allgemein

Runaway App von Fatima & Michel. Ermöglicht es herauszufinden wann es an deinem Standort regnet, und
zeigt den nähesten Ort an, in dem es nicht regnet. Das Projekt wird in Flutter realisiert. Es wurde
ein Coding Style definiert (Coding.md) um einen gmeinsamen Stil zu definieren.

# Quickstart-Guide

Es wird mindestens eine SDK Version 30 benötigt, um das Projekt laufen zu lassen, empfohlen wird SDK
Version 31. Falls eine VM verwendet wird, sollte sichergegangen werden, dass diese die Anforderungen
erfüllt.

Bei der App handelt es sich um eine Flutter App, dies bedeutet Flutter muss installiert sein.

Um das Programm zum Laufen zu bringen, muss pub get ausgeführt werden, um die Dependencies zu
downloaden. Die Main befindet sich in "lib\main.dart".

Das Programm verwendet die Library Splashscreen, weshalb als zusätzliches Argument
"--no-sound-null-safety" übergeben werden muss.

# Pages-Guide:

1. Ladeseite
2. Login-Seite mit Email und Passwort, Google-Sign-In, Anonymes Login, Registrierung
   2.1 Registrierungsseite
3. Startseite mit derzeitigem Standort und Orte mit besserem Wetter in der Umgebung (können mit
   Klick auf das Herz zu Favoriten hinzugefügt werden)
   3.1 Bei Klick auf anderen Ort öffnet sich Übersichtsseite des Ortes (Wie weit ist dieser
   entfernt, etc.)
4. Falls Favorit hinzugefügt wurde, wird auf "My Locations" dieser Ort in einer Liste festgehalten.
5. In den Settings kann die Sprache eingestellt werden und in welcher Einheit die Temperatur
   angezeigt werden soll
6. Logout

# Übersicht über Code-Aufbau:

Wir haben unseren Code in mehrere Ordner unterteilt. Zuerst haben wir einen Logik-Ordner, welcher
die Logik des Codes hält. Beispielsweise die Authentication und den Screen-Size-Calculator.

Im Ordner Pages werden alle Routen definiert. Des Weiteren befinden sich in jeder Page ein Ordner
für Testing, sowie weitere Unterordner für weitere Widgets, die zu dieser Seite gehören.

In dem Ordner Widgets befinden sich grafische Elemente, welche nicht zu einer bestimmten Seite
gehören, und folglich nicht in einen Ordner einsortiert werden können.

Die main.dart ist außerhalb jeglicher Ordner. Dies ist der Startpunkt der App, welche direkt in Lib
Zu finden ist.

# Verschiedene Seiten

Nach dem Login verläuft das Navigieren der Seiten hauptsächlich mithilfe des Drawers.

## Login

Diese Seite erlaubt es dem:r Nutzer:in, sich einzuloggen. Dies kann erfolgen durch anonymen durch
Passwortgeschützten,- und durch Google Login.

## Register

Erlaubt es dem:r Benutzer:in sich mit einer E-Mail und einem Passwort zu registrieren.

## Menü

Erlaubt es dem:r Nutzer:in Orte zu sehen, welche eine bessere Temperatur haben als der momentane
Ort, diese Orte zu favorisieren, und in eine Detailansicht zu wechseln, indem man auf diese klickt.

## Place

Place ist eine Seite spezifisch zum Überprüfen, wie die Informationen des Ortes sind, sowie einer
Karte, um den Weg dahin zu finden.

## Settings

Settings erlaubt es dem:r Nutzer:in Einstellungen vorzunehmen. Sprachsupport, für Latein, Esperanto und
Klingonisch ist leider noch nicht gegeben. Binär und Morsecode wird aus Layout gründen nicht mehr
implementiert.

## Favorites

Zeigt alle favorisierten Orte des:r Nutzers:in an.