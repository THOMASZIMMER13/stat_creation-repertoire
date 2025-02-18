######################################################################
# AUTEUR  : Thomas ZIMMER
# Date    : 03/01/2022
# Comment : Ce script recherche dans un ou plusieurs emplacements
#           et affiche les dossiers crees ou modifies à partir
#           d'une année donnée par l'utilisateur.
######################################################################

function Compteur_dossier() {
    # Demande à l'utilisateur de saisir les chemins à analyser, séparés par des points-virgules
    $chemin = Read-Host "Merci d'entrer le chemin des repertoires à analyser, separes par des ';'"
    $Tempchemin = $chemin.Split(';')  # Conversion des chemins en tableau

    # Demande à l'utilisateur de saisir l'année à partir de laquelle rechercher les dossiers modifiés
    [Int]$an = Read-Host "Pour quelle annee voulez-vous afficher les dossiers modifies ? (type (AAAA))"
    $AnCourant = Get-Date -Format "yyyy"  # Récupère l'année actuelle
    $AnRecherche = $an  # Stocke l'année de recherche

    # Recherche dans chaque emplacement spécifié
    ForEach ($element in $Tempchemin) {
        $an = $AnRecherche  # Remise à zéro de l'année pour chaque élément

        Write-Host "Dans le répertoire : $element"

        # Effectue la recherche pour chaque année depuis l'année indiquée jusqu'à l'année en cours
        Do {
            # Création des timestamps pour le 1er jour et le dernier jour de l'année
            $DebutAn = Get-Date -Date "01/01/$an"
            $FinAn = Get-Date -Date "31/12/$an"

            # Initialisation du compteur (nombre de dossiers modifiés durant l'année)
            $compteur = 0
            $d = Get-ChildItem -Path $element -Directory  # Liste des répertoires dans l'emplacement

            # Pour chaque répertoire, on vérifie si sa date de création est dans l'année recherchée
            ForEach ($directory in $d) {
                # Si la date de création est entre le début et la fin de l'année
                if ( ($directory.CreationTime -ge $DebutAn) -and ($directory.CreationTime -le $FinAn) ) {
                    # Incrémentation du compteur
                    $compteur += 1
                }
            }

            # Affichage du nombre de dossiers créés dans l'année
            Write-Host "Dossiers créés en $an : Total de $compteur"

            # On passe à l'année suivante
            $an += 1
        } while ($an -le $AnCourant)  # Tant que l'année n'a pas atteint l'année en cours
    }

    return $true  # Retourne true pour signaler la fin de la fonction
}

# Exécution initiale de la fonction
$test = $false
$test = Compteur_dossier

# Si la fonction retourne true, la relancer pour un autre tour
while ($test -eq $true) {
    $test = Compteur_dossier
}
