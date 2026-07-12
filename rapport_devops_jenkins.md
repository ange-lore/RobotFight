# Rapport de Travaux Pratiques DevOps – Jenkins

**Étudiant :** Ange MADJIOBOU  
**Date :** 12 Juillet 2026  
**Formation :** DevOps, Intégration Continue et Livraison Continue avec Jenkins  

---

## Remerciements

Je tiens à exprimer ma gratitude à l'ensemble de l'équipe pédagogique pour la qualité des supports de cours et l'accompagnement technique durant cette formation. Ces travaux pratiques m'ont permis d'appréhender concrètement les enjeux de l'automatisation et de la culture DevOps au sein d'un cycle de vie logiciel moderne. Un grand merci également à mes pairs pour les échanges enrichissants lors des phases de résolution de problèmes techniques.

---

## Introduction

### Le mouvement DevOps
Le DevOps n'est pas seulement un ensemble d'outils, mais une culture visant à unifier le développement logiciel (Dev) et l'exploitation des systèmes (Ops). L'objectif principal est de réduire le temps entre l'écriture d'un changement sur le code et son déploiement en production, tout en garantissant une qualité optimale.

### Intégration Continue (CI)
L'Intégration Continue est la pratique consistant à fusionner fréquemment le code des développeurs dans un tronc commun. Chaque commit déclenche automatiquement un cycle de compilation et de tests unitaires pour détecter les régressions le plus tôt possible.

### Livraison et Déploiement Continus (CD)
- **Livraison Continue (Continuous Delivery) :** L'application est maintenue dans un état livrable en permanence. Le déploiement vers la production est déclenché manuellement.
- **Déploiement Continu (Continuous Deployment) :** Extension de la livraison continue où chaque changement validé par le pipeline est automatiquement poussé en production sans intervention humaine.

### Jenkins
Jenkins est le serveur d'automatisation open-source de référence. Sa force réside dans son extensibilité (plus de 1800 plugins) et sa capacité à orchestrer des workflows complexes, qu'ils soient configurés via l'interface graphique ou par code (Pipeline as Code).

### Objectifs de la formation
L'objectif de cette série de TP est de maîtriser Jenkins de son installation à son administration avancée, en passant par l'interconnexion avec des outils tiers (Git, Maven, SonarQube, Tomcat) et la mise en place d'architectures distribuées (Maître/Agents).

---

## Présentation de l'environnement technique

Pour réaliser ces travaux, nous avons utilisé un écosystème d'outils standards du marché :

- **Windows :** Système d'exploitation hôte pour la gestion des fichiers et l'accès à l'interface web.
- **Docker :** Utilisé pour conteneuriser Jenkins, SonarQube, Tomcat et les agents. Cela garantit un environnement reproductible et isolé.
- **Git & GitHub :** Gestionnaire de source pour le versionnement du code et des Jenkinsfiles.
- **Maven :** Outil de gestion et d'automatisation de production de projets Java.
- **SonarQube :** Plateforme de mesure et d'analyse de la qualité du code (dette technique, vulnérabilités).
- **Tomcat :** Serveur d'application Java utilisé comme cible de déploiement.
- **Agents Jenkins :** Noeuds distants permettant de décharger le maître et d'exécuter des builds sur différents environnements (Linux/Docker).

---

## TP1 – Création et compilation d'un projet Freestyle

### Objectif officiel
Apprendre à créer un premier job Jenkins de type "Freestyle" pour compiler une application Java simple.

### Manipulations réalisées
L'installation de Jenkins a été réalisée via Docker avec la commande :
`docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts`

Après avoir récupéré le mot de passe initial (`initialAdminPassword`), nous avons procédé à l'installation des plugins suggérés et à la création du premier utilisateur administrateur.

Ensuite, nous avons créé un "Nouveau Item" de type "Projet free-style". Nous avons configuré l'étape de build pour exécuter un script shell simple simulant une compilation.

### Analyse des captures
- **Figure 1 : Récupération du mot de passe initial**
  ![Récupération du mot de passe](TP1/Récuperepasswordinitial.png)
  *Légende : Accès au fichier secret pour déverrouiller Jenkins.*

- **Figure 2 : Installation des plugins**
  ![Plugins installés](TP1/plugging installé.png)
  *Légende : Phase d'initialisation de l'instance avec les modules standards.*

- **Figure 3 : Connexion effectuée**
  ![Connexion](TP1/CONNEXION EFFECTUE.png)
  *Légende : Interface d'accueil de Jenkins après authentification.*

- **Figure 4 : Configuration HTTPS**
  ![HTTPS](TP1/HTTPS.png)
  *Légende : Vérification des paramètres de sécurité de la connexion.*

- **Figure 5 : Détails de la configuration système**
  ![Config système](TP1/Capture%20d’écran%202026-07-09%20160027.png)
  *Légende : Paramétrage des variables d'environnement globales.*

### Résultats et Conclusion
Le build s'est terminé avec le statut "SUCCESS". Nous avons pu observer la sortie console et vérifier que le workspace contenait les fichiers générés. Ce TP valide la mise en route opérationnelle de Jenkins.

---

## TP2 – Création et compilation d'un projet Maven

### Objectif officiel
Industrialiser le build en utilisant Maven pour gérer les dépendances, la compilation et les tests.

### Manipulations réalisées
1. Installation du plugin "Maven Integration".
2. Déclaration de l'outil Maven dans "Global Tool Configuration".
3. Création d'un job de type "Projet Maven".
4. Configuration du chemin vers le `pom.xml` et définition des "Goals" : `clean install`.

### Analyse des captures
- **Figure 6 : Création du projet Freestyle initial**
  ![Projet Freestyle](TP2/Projet%20Freestyle.png)
  *Légende : Transition vers une structure de projet plus structurée.*

- **Figure 7 : Confirmation de l'interface**
  ![Bonjour Jenkins](TP2/Bonjour%20Jenkins.png)
  *Légende : Vérification du bon fonctionnement du serveur.*

- **Figure 8 : Configuration avancée du job Maven**
  ![Config Maven](TP2/Capture%20d’écran%202026-07-09%20174830.png)
  *Légende : Paramétrage des options de build Maven.*

### Résultats et Conclusion
L'utilisation d'un projet dédié Maven permet une meilleure intégration. Jenkins reconnaît nativement les cycles de vie Maven et peut extraire automatiquement les rapports de tests JUnit.

---

## TP3 – Interconnexion Jenkins / GitHub

### Objectif officiel
Automatiser le déclenchement des builds à chaque modification du code source sur GitHub.

### Manipulations réalisées
- Configuration des Credentials dans Jenkins avec un Personal Access Token (PAT) GitHub.
- Création d'un Webhook sur le dépôt GitHub pointant vers l'URL de Jenkins.
- Activation de l'option "GitHub hook trigger for GITScm polling" dans la configuration du job.

### Analyse des captures
- **Figure 9 : Test de compilation Maven**
  ![Test Maven](TP3/Test%20Maven.png)
  *Légende : Exécution du cycle Maven via Jenkins.*

- **Figure 10 : Résultat du build**
  ![Test](TP3/Test.png)
  *Légende : Confirmation de la réussite du build après intégration SCM.*

- **Figure 11 : Détails de l'intégration SCM**
  ![Intégration SCM 1](TP3/Capture%20d’écran%202026-07-10%20001130.png)
  *Légende : Configuration du dépôt distant GitHub.*

- **Figure 12 : Webhook et déclencheurs**
  ![Intégration SCM 2](TP3/Capture%20d’écran%202026-07-10%20001155.png)
  *Légende : Paramétrage du déclenchement automatique.*

### Résultats et Conclusion
Chaque "push" sur le dépôt GitHub déclenche désormais instantanément un build. C'est la mise en œuvre concrète du pipeline CI.

---

## TP4 – Mesure de la qualité du code avec SonarQube

### Objectif officiel
Intégrer une analyse statique du code pour mesurer la dette technique et respecter des "Quality Gates".

### Manipulations réalisées
- Lancement de SonarQube via Docker sur le port 9000.
- Installation du plugin "SonarQube Scanner" dans Jenkins.
- Ajout de la commande `sonar:sonar` dans les goals Maven du build.
- Configuration du Quality Gate pour bloquer le build en cas de non-respect des seuils de couverture (ex: < 80%).

### Analyse des captures
- **Figure 13 : Configuration de l'analyse Sonar**
  ![Analyse Qualité](TP4/Capture%20d’écran%202026-07-10%20010807.png)
  *Légende : Définition des paramètres d'analyse.*

- **Figure 14 : Rapport de qualité détaillé**
  ![Rapport Sonar](TP4/Capture%20d’écran%202026-07-10%20011422.png)
  *Légende : Visualisation des vulnérabilités et des "Code Smells".*

- **Figure 15 : Tableau de bord SonarQube**
  ![Tableau de bord](TP4/Capture%20d’écran%202026-07-10%20010538.png)
  *Légende : Aperçu global de la santé du projet.*

- **Figure 16 : Validation du Quality Gate**
  ![Quality Gate](TP4/Capture%20d’écran%202026-07-10%20120745.png)
  *Légende : Confirmation du passage des seuils de qualité.*

### Résultats et Conclusion
Le projet est désormais analysé à chaque build. Si le code ne respecte pas les standards de qualité, le build est marqué comme échoué, garantissant l'intégrité de la base de code.

---

## TP5 – Builds paramétrés

### Objectif officiel
Rendre les jobs réutilisables en permettant à l'utilisateur de saisir des variables au lancement du build.

### Manipulations réalisées
- Activation de l'option "Ce build a des paramètres".
- Ajout d'un paramètre de type "Choice" pour l'environnement (dev, recette, prod).
- Ajout d'un paramètre "String" pour le numéro de version.
- Utilisation de ces variables (`$ENVIRONMENT`, `$VERSION`) dans les étapes de build.

### Analyse des captures
- **Figure 17 : Interface de lancement paramétré**
  ![Paramètres](TP5/Capture%20d’écran%202026-07-12%20073953.png)
  *Légende : Choix des options avant l'exécution.*

- **Figure 18 : Confirmation des variables**
  ![Variables](TP5/Capture%20d’écran%202026-07-12%20074109.png)
  *Légende : Vérification des valeurs passées au build.*

### Résultats et Conclusion
Un même job peut désormais servir à déployer différentes versions sur différents environnements, réduisant ainsi la duplication de configuration.

---

## TP6 – Déploiement automatique sur Tomcat

### Objectif officiel
Réaliser le déploiement continu en poussant automatiquement l'artefact (WAR) vers un serveur Tomcat.

### Manipulations réalisées
- Configuration des rôles `manager-script` dans le fichier `tomcat-users.xml`.
- Installation du plugin "Deploy to container".
- Ajout d'une action post-build pour transférer le fichier `.war` généré par Maven vers l'URL de Tomcat.

### Analyse des captures
- **Figure 19 : Test de déploiement en Recette**
  ![Test recette](TP6/Test%20recette%201.1.0.png)
  *Légende : Validation fonctionnelle sur l'environnement de recette.*

- **Figure 20 : Déploiement en Production**
  ![Test prod](TP6/Test%20prod%202.0.0.png)
  *Légende : Passage en production de la version finale.*

- **Figure 21 : Test en développement**
  ![Test dev](TP6/test%20dev%201.0.0.png)
  *Légende : Déploiement initial sur l'environnement de développement.*

- **Figure 22 : Configuration du déploiement**
  ![Config déploiement 1](TP6/Capture%20d’écran%202026-07-12%20080102.png)
  *Légende : Paramétrage du plugin de déploiement.*

- **Figure 23 : Authentification Tomcat**
  ![Config déploiement 2](TP6/Capture%20d’écran%202026-07-12%20080251.png)
  *Légende : Gestion des identifiants pour le manager Tomcat.*

- **Figure 24 : Logs de déploiement**
  ![Config déploiement 3](TP6/Capture%20d’écran%202026-07-12%20080341.png)
  *Légende : Confirmation du transfert réussi de l'artefact.*

- **Figure 25 : Bonus - Déploiement multi-versions**
  ![Bonus TP6](TP6/bonus.png)
  *Légende : Gestion simultanée de plusieurs versions sur le serveur.*

### Résultats et Conclusion
L'application est déployée sans intervention manuelle dès que les tests passent. La chaîne CI/CD est complète.

---

## TP7 – Jenkins Pipeline

### Objectif officiel
Découvrir la syntaxe des Pipelines Jenkins pour décrire le workflow sous forme de script (Groovy DSL).

### Manipulations réalisées
- Création d'un job de type "Pipeline".
- Rédaction d'un script `pipeline { ... }` définissant les étapes : Checkout, Build, Test, Deploy.
- Visualisation du "Stage View" pour suivre l'avancement de chaque étape.

### Analyse des captures
- **Figure 26 : Vue Tomcat Manager**
  ![Tomcat Manager](TP7/TOMCAT%20MANAGER.png)
  *Légende : Vérification des applications déployées sur Tomcat.*

- **Figure 27 : Réussite du Pipeline**
  ![Build TP7](TP7/BUILD%20TP7.png)
  *Légende : Visualisation graphique des étapes franchies avec succès.*

- **Figure 28 : Interface Tomcat**
  ![Tomcat UI](TP7/TOMCAT.png)
  *Légende : Page d'accueil du serveur Tomcat.*

- **Figure 29 : Détails du Stage View**
  ![Stage View 7](TP7/Capture%20d’écran%202026-07-12%20132704.png)
  *Légende : Temps d'exécution par étape du pipeline.*

- **Figure 30 : Bonus - Pipeline scripté**
  ![Bonus TP7](TP7/Bonus%20TP7.png)
  *Légende : Exploration de la syntaxe scriptée Groovy.*

### Résultats et Conclusion
Le Pipeline offre une visibilité bien supérieure aux jobs Freestyle et permet de gérer des workflows complexes plus facilement.

---

## TP8 – Jenkinsfile et Pipeline as Code

### Objectif officiel
Versionner le pipeline dans le code source de l'application via un fichier `Jenkinsfile`.

### Manipulations réalisées
- Création d'un fichier `Jenkinsfile` à la racine du projet GitHub.
- Configuration du job Jenkins pour utiliser "Pipeline script from SCM".
- Mise en place d'un "Multibranch Pipeline" pour gérer automatiquement les branches (feature branches).

### Analyse des captures
- **Figure 31 : Contenu du Jenkinsfile**
  ![Fichier Jenkinsfile](TP8/FIchier%20Jenkinsfile.png)
  *Légende : Définition des stages Build, Test et Deploy en code.*

- **Figure 32 : Multibranch Pipeline**
  ![Multibranch](TP8/multibranch.png)
  *Légende : Détection automatique des branches du dépôt.*

- **Figure 33 : Pipeline initial**
  ![Pipeline 1](TP8/1%20PIPELINE%20.png)
  *Légende : Premier essai de pipeline déclaratif.*

- **Figure 34 : Intégration Git Pipeline**
  ![Pipeline 2](TP8/2%20PIPELINE%20GIT.png)
  *Légende : Connexion au SCM dans le script.*

- **Figure 35 : Configuration du projet Pipeline**
  ![Config Pipeline](TP8/configure.png)
  *Légende : Paramètres du job dans l'interface Jenkins.*

- **Figure 36 : Développement du pipeline**
  ![Pipeline Dev](TP8/develop%20pipeline.png)
  *Légende : Evolution du script avec de nouvelles étapes.*

- **Figure 37 : Vue d'ensemble des stages**
  ![Stages View 8](TP8/STAGES%20VIEW.png)
  *Légende : Visualisation complète du cycle de vie.*

- **Figure 38 : Logs d'exécution RobotCombar**
  ![Log RobotCombar](TP8/Log%20BUILD%20ROBOTCOMBAR%20TP8.png)
  *Légende : Détails de l'exécution sur un projet spécifique.*

### Résultats et Conclusion
Le "Pipeline as Code" permet de conserver l'historique des modifications du workflow de build en même temps que le code de l'application.

---

## TP9 – Architecture Maître / Agent

### Objectif officiel
Mettre en place une architecture distribuée pour décharger le maître Jenkins et exécuter des builds sur des agents spécialisés.

### Manipulations réalisées
- Création d'un agent Linux via Docker : `docker run -d jenkins/ssh-agent`.
- Déclaration d'un nouveau nœud dans Jenkins (Gestion des nœuds).
- Configuration de la connexion SSH et définition d'un label `linux`.
- Utilisation de la directive `agent { label 'linux' }` dans le pipeline pour forcer l'exécution sur l'agent.

### Observations et résultats
- **Répartition de charge :** Les builds se répartissent sur les executors disponibles.
- **Builds parallèles :** Plusieurs jobs peuvent s'exécuter simultanément sur différents agents.
- **Agent offline :** Si l'agent est arrêté, les builds sont mis en file d'attente.

### Analyse des captures
- **Figure 39 : Configuration du nœud**
  ![Config Node](TP9/1%20Configur%20node.png)
  *Légende : Paramétrage de l'agent distant.*

- **Figure 40 : Test de restriction de label**
  ![Restriction](TP9/TEST%20RESTRINCTION.png)
  *Légende : Vérification que le job ne s'exécute que sur l'agent autorisé.*

- **Figure 41 : Démarrage de l'agent Linux**
  ![Start Agent](TP9/START%20AGEN-LINUX.png)
  *Légende : Lancement du conteneur agent.*

- **Figure 42 : Observation de l'arrêt de l'agent**
  ![Stop Agent](TP9/observation%20stop%20agent-linux.png)
  *Légende : Impact sur les builds lors de la perte de l'agent.*

- **Figure 43 : Ralentissement d'un build**
  ![Slow Build](TP9/RALENTIR%20UN%20BUILD.png)
  *Légende : Simulation de charge pour tester la file d'attente.*

- **Figure 44 : Ralentissement d'un job**
  ![Slow Job](TP9/RALENTIR%20UN%20JOB.png)
  *Légende : Analyse des goulots d'étranglement.*

- **Figure 45 : Détails de configuration agent 1**
  ![Conf 1](TP9/conf1.png)
  *Légende : Paramètres de connexion SSH.*

- **Figure 46 : Détails de configuration agent 2**
  ![Conf 2](TP9/conf2.png)
  *Légende : Gestion des executors et des labels.*

---

## TP10 – Sécurité, Sauvegarde et Restauration

### Objectif officiel
Sécuriser l'instance Jenkins et mettre en place une stratégie de sauvegarde robuste.

### Manipulations réalisées
- **Sécurité :** Activation de la base d'utilisateurs interne et mise en place d'une "Matrix-based security". Création des comptes `admin`, `dev` (droits de build) et `reader` (lecture seule).
- **Sauvegarde :** Installation du plugin `ThinBackup`. Configuration du répertoire de sauvegarde et planification de sauvegardes complètes (incluant les jobs, plugins et configurations).

### Analyse des captures
- **Figure 47 : Création des comptes utilisateurs**
  ![Comptes](TP10/1%20creation%20des%20comptes.png)
  *Légende : Gestion de la base utilisateur Jenkins.*

- **Figure 48 : Sauvegarde automatique**
  ![ThinBackup](TP10/sauvegarde%20automatique%20.png)
  *Légende : Configuration du plugin de backup.*

- **Figure 49 : Compte utilisateur Développeur**
  ![Compte Dev](TP10/dev.png)
  *Légende : Attribution des droits pour les développeurs.*

- **Figure 50 : Compte utilisateur Lecteur**
  ![Compte Reader](TP10/reader.png)
  *Légende : Attribution des droits en lecture seule.*

- **Figure 51 : Vérification du compte Reader**
  ![Reader View](TP10/compte%20reader.png)
  *Légende : Interface restreinte pour l'utilisateur reader.*


### Résultats et Conclusion
L'instance est désormais protégée contre les accès non autorisés et les pertes de données. La restauration a été testée avec succès en simulant une suppression de configuration.

---

## Difficultés rencontrées

Durant ces travaux pratiques, plusieurs obstacles techniques ont été surmontés :

1. **Problèmes de connexion SSH (TP9) :**
   - *Problème :* Impossible pour le maître de se connecter à l'agent Docker.
   - *Analyse :* Les clés SSH n'étaient pas correctement injectées dans le conteneur agent.
   - *Solution :* Utilisation des credentials de type "SSH Username with private key" et vérification des permissions sur l'agent.
   - *Résultat :* Connexion établie et agent opérationnel.

2. **Configuration réseau Docker (TP4/TP6) :**
   - *Problème :* Jenkins ne parvenait pas à joindre SonarQube ou Tomcat via `localhost`.
   - *Analyse :* Dans un réseau Docker, chaque conteneur a sa propre boucle locale.
   - *Solution :* Utilisation du nom du conteneur dans les URLs (ex: `http://sonarqube:9000`) après avoir placé tous les conteneurs sur le même réseau Docker.

3. **Gestion des permissions ThinBackup (TP10) :**
   - *Problème :* Le plugin ne parvenait pas à écrire les sauvegardes sur le volume monté.
   - *Analyse :* Droits d'écriture insuffisants pour l'utilisateur `jenkins` sur le dossier hôte.
   - *Solution :* Commande `chown -R 1000:1000` sur le répertoire de backup.

---

## Bonnes pratiques DevOps appliquées

- **Pipeline as Code :** Utilisation systématique du `Jenkinsfile` pour assurer la traçabilité.
- **Gestion des credentials :** Aucune donnée sensible (mot de passe, token) n'a été codée en dur.
- **Séparation Contrôleur/Agent :** Isolation des builds pour protéger l'intégrité du serveur maître.
- **Qualité logicielle :** Utilisation de SonarQube pour empêcher la dette technique de s'accumuler.
- **Infrastructure as Code (via Docker) :** Déploiement reproductible de l'ensemble de l'environnement technique.

---

## Bilan général

Cette formation m'a permis d'acquérir une expertise solide sur l'outil Jenkins et son intégration dans une chaîne DevOps moderne. Les compétences acquises incluent :
- La maîtrise de l'installation et de la configuration de **Jenkins via Docker**.
- L'automatisation complète des cycles de production avec **Maven et GitHub**.
- La garantie de la qualité logicielle avec **SonarQube**.
- La mise en œuvre du **Déploiement Continu sur Tomcat**.
- La gestion avancée de la sécurité, de la haute disponibilité (Agents) et des sauvegardes.

Ces acquis constituent une base fondamentale pour toute démarche de transformation DevOps en entreprise.

---
*Fin du rapport*
