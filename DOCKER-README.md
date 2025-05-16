# Docker pour le projet CCIS

Ce projet est configuré pour fonctionner avec Docker, ce qui facilite la mise en place de l'environnement de développement.

## Prérequis

-   Docker
-   Docker Compose

## Installation

1. Clonez ce dépôt
2. Configurez votre fichier .env (il est déjà présent)
3. Exécutez les commandes suivantes:

```bash
# Démarrer tous les conteneurs
docker-compose up -d

# Vérifier que les conteneurs fonctionnent
docker-compose ps
```

## Services inclus

-   **app**: Le service PHP (Laravel)
-   **nginx**: Le serveur web
-   **db**: Le service MySQL
-   **phpmyadmin**: Interface d'administration pour MySQL
-   **node**: Le service Node.js pour le frontend (Vue.js)

## Accès aux services

-   Site web: http://localhost:4000
-   phpMyAdmin: http://localhost:4041
-   Base de données:
    -   Hôte: localhost
    -   Port: 3306
    -   Utilisateur: laravel (ou la valeur de DB_USERNAME dans .env)
    -   Mot de passe: root (ou la valeur de DB_PASSWORD dans .env)
    -   Base de données: CCIS (ou la valeur de DB_DATABASE dans .env)

## Commandes utiles

```bash
# Démarrer les conteneurs
docker-compose up -d

# Arrêter les conteneurs
docker-compose down

# Exécuter une commande Artisan
docker-compose exec app php artisan <command>

# Exécuter une commande Composer
docker-compose exec app composer <command>

# Exécuter une commande NPM
docker-compose exec node npm <command>
```

## Problèmes courants

### Erreur de permission

Si vous rencontrez des erreurs de permission, vous pouvez essayer de modifier les valeurs `user` et `uid` dans le fichier `docker-compose.yml` pour qu'elles correspondent à votre utilisateur système.
