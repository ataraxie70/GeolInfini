# LevelUP — Mission Engine

## Rôle
Générer et gérer les missions dans une logique de progression disciplinée.

## Types de missions
- Study Mission
- Quiz Mission
- Revision Mission
- Project Mission
- Emergency Mission

## Cycle
Generated -> Notified -> Available -> Activated -> Completed

Cas d'échec :
Notified -> Expired -> Mandatory

## Délai
Chaque mission possède :
- une date de notification
- une fenêtre d'activation
- une deadline
- un état obligatoire si non activée à temps

## Rigueur
Le système reste motivant mais impose :
- des délais réels
- des rappels
- des sanctions progressives
- des missions correctives
