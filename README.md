# Configuration Vim Desertink

Configuration personnelle de Vim orientée vers le développement en C et C++, avec une interface rétro basée sur le thème **Desertink**. Elle regroupe la coloration syntaxique, l’exploration de fichiers, la recherche floue, l’intégration Git et l’analyse du code.

## Fonctionnalités

- Thème sombre Desertink et barre de statut Airline.
- Explorateur de fichiers avec NERDTree.
- Recherche de fichiers et de texte avec fzf, fzf.vim et ripgrep.
- Intégration Git avec vim-fugitive.
- Commentaires et édition plus pratique grâce à vim-commentary, vim-surround et auto-pairs.
- Analyse et complétion C/C++ avec ALE et clangd.
- Formatage manuel avec clang-format.
- Numéros de ligne relatifs, surlignage de la ligne courante et repère à 80 colonnes.
- Indentation de 4 espaces, adaptée au style C.

## Prérequis

- Vim avec prise en charge de `+termguicolors` et de la fonctionnalité clipboard si vous souhaitez utiliser le presse-papiers système.
- [vim-plug](https://github.com/junegunn/vim-plug), le gestionnaire de plugins utilisé par cette configuration.
- Pour la recherche de contenu : [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`).
- Pour le développement C/C++ : `clangd`, `clang-format`, ainsi que `gcc` et `g++`.

Les outils externes doivent être installés séparément et disponibles dans le `PATH`.

## Installation

1. Sauvegardez votre configuration Vim existante :

   ```sh
   cp ~/.vimrc ~/.vimrc.backup
   ```

2. Copiez le fichier `.vimrc` de ce dépôt vers `~/.vimrc` :

   ```sh
   cp .vimrc ~/.vimrc
   ```

3. Ouvrez Vim et installez les plugins :

   ```vim
   :PlugInstall
   ```

4. Redémarrez Vim pour appliquer toute la configuration.

## Raccourcis principaux

La touche leader est **Espace**.

| Raccourci | Action |
| --- | --- |
| `<Leader>e` | Afficher ou masquer NERDTree |
| `<Leader>p` | Rechercher des fichiers avec fzf |
| `<Leader>g` | Rechercher du texte avec ripgrep via fzf |
| `<Leader>b` | Parcourir les buffers ouverts |
| `gd` | Aller à la définition avec ALE |
| `gr` | Rechercher les références avec ALE |
| `K` | Afficher les informations ALE sur le symbole sous le curseur |
| `[e` / `]e` | Diagnostic ALE précédent / suivant |
| `<Leader>f` | Appliquer le formateur ALE au buffer |

## Personnalisation

La configuration se trouve dans le fichier [`.vimrc`](.vimrc). Les plugins sont déclarés au début du fichier et les réglages ALE sont orientés C/C++ : `clangd` et `gcc` pour C, `clangd` et `g++` pour C++, avec `clang-format` comme formateur.

L’indentation utilise 4 espaces (`expandtab`). Pour utiliser de vraies tabulations, remplacez `set expandtab` par `set noexpandtab`.

## Licence

Aucune licence n’est spécifiée pour le moment.
