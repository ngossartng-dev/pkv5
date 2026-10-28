# Poker Academy - Package Maître Définitif (Toutes briques & Leak Finder)

Ce dépôt contient l'intégralité du code source structuré, corrigé et unifié pour le MVP **Poker Academy** :
- `lib/main.dart` : Point d'entrée avec écran de démarrage, contrôle d'âge sécurisé (+18 ans) et menu de navigation vers la simulation et l'académie.
- `lib/views/simulation_table_screen.dart` : Table ovale 6-max, bots, cartes à 4 couleurs, slider de sizing et pop-up de sanction du Professeur Virtuel.
- `lib/views/academy_lessons_screen.dart` : Modules d'apprentissage théorique (C-Bet, Isolation, Push/Fold).
- `backend/bot_engine.py` : Moteur de décision des 3 bots comportementaux (sans erreur de syntaxe).
- `backend/leak_finder.py` : Module d'analyse des erreurs et calcul des pertes d'EV.
- `backend/database_schema.sql` : Schéma de base de données relationnelle PostgreSQL.
