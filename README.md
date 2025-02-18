# Script : stat_création-repertoire.ps1

Le script `stat_création-repertoire.ps1` permet d'afficher les modifications de répertoires sur plusieurs années. Ce script est particulièrement utile pour repérer rapidement les données qui n'ont pas été utilisées depuis longtemps.

## Fonctionnement

1. **Demande des emplacements à examiner**  
   En premier lieu, le script demande à l'utilisateur de saisir un ou plusieurs emplacements à examiner (séparés par des virgules). Il est important de noter qu'il n'y a pas de récursivité dans ce cas, ce qui signifie que seuls les répertoires spécifiés seront examinés.

2. **Demande de l'année de départ**  
   Ensuite, le script demande à partir de quelle année la recherche doit être effectuée. Cela permet de définir une plage de temps à partir de laquelle les répertoires modifiés seront comptabilisés.

3. **Affichage des résultats**  
   Pour chaque emplacement, le script affiche le nombre de dossiers modifiés depuis l'année spécifiée jusqu'à aujourd'hui.

4. **Fonction réutilisable**  
   Ce script est conçu comme une fonction, ce qui permet de la réutiliser facilement dans d'autres scripts. À la fin de l'exécution, la fonction est rappelée, ce qui permet à l'utilisateur de traiter d'autres répertoires si nécessaire.

## Exemple d'utilisation

Lorsque vous exécutez le script, il vous demandera :

- **Emplacements à examiner** : Entrez un ou plusieurs répertoires (séparés par une virgule).
- **Année de départ** : Entrez l'année à partir de laquelle la recherche doit être effectuée.

Ensuite, il affichera le nombre de répertoires modifiés depuis cette année jusqu'à aujourd'hui pour chaque emplacement spécifié.