# WorldWideNews
Test Technique

Temps Consacré sur le Test: Du 12/05/23 au 19/05/23

L'Architecture de l'application est en MVVM avec utilisation de Service pour gérer les ViewModels
L'Application possède un Model en commun et chacun possède son propre Service et ViewModel pour une gestion indépendante de chacun d'entre eux

L'Application est configuré pour montrer toutes les infos en Langue Française, selon la catégorie sélectionné et dispose une option de changement en Langue Anglaise pour la première page "News"

En cliquant sur les articles voulu, une page au détail s'affiche avec un Button affichant une Alert demandant à l'utilisateur de confirmer son choix avec l'affichage du lien vers lequel ce dernier sera redirigé avec l'aide d'une SafariView 

L'Application dispose d'une seconde option, cette fois-ci de Recherche
La fonction de Recherche dans cette version prends en charge les noms propres comme les prénoms, les noms de ville par exemple

Dans l'état actuel de l'application, il aurait probablement été plus efficient d'utilisé un Singleton plutôt que d'avoir un Service pour chaque fonctionnalité afin de tout centralisé

L'Application est codé avec l'utilisation du Concurrency plutôt que Combine ou RxSwift

Je m'en suis aperçu un tard durant le développement de l'application, c'est pour ça qu'elle n'est pas présente 

Voici quelques screenshots de l'application, j'y ai apposé un Logo avec un Écran de démarrage pour la rendre plus sympatique

![Simulator Screenshot - iPhone 14 - 2023-05-19 at 16 12 56](https://github.com/Faustharus/WorldWideNews/assets/48592115/fc8eda5d-1da7-46f8-ab76-f773f5f365e8)
![Simulator Screenshot - iPhone 14 - 2023-05-19 at 16 13 03](https://github.com/Faustharus/WorldWideNews/assets/48592115/6dd6804a-f152-4060-a133-0f98741a916f)
![Simulator Screenshot - iPhone 14 - 2023-05-19 at 16 13 10](https://github.com/Faustharus/WorldWideNews/assets/48592115/67df313d-6234-4009-a125-8579115c6892)
![Simulator Screenshot - iPhone 14 - 2023-05-19 at 16 14 10](https://github.com/Faustharus/WorldWideNews/assets/48592115/991e8b7a-5d4b-470c-a0e8-bd40cd418e5c)

