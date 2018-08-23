# pardubice.pirati.cz

[![Build Status](https://travis-ci.org/pirati-web/pardubice.pirati.cz.svg?branch=master)](https://travis-ci.org/pirati-web/pardubice.pirati.cz)

Web Pardubické pirátské buňky.

## Obsah
- [pardubice.pirati.cz](#pardubicepiraticz)
    - [Obsah](#obsah)
    - [Instalace](#instalace)
        - [Varianta 1 - Docker](#varianta-1---docker)
        - [Varianta 2 - Přímé spuštění](#varianta-2---pime-sputni)
            - [Fedora 25](#fedora-25)
                - [Instalace závislostí](#instalace-zavislosti)
            - [Ubuntu 16.04](#ubuntu-1604)
                - [Instalace závislostí](#instalace-zavislosti)
            - [macOS](#macos)
                - [Instalace závislostí](#instalace-zavislosti)
                - [Další postup](#dali-postup)
    - [Spuštění](#sputni)
        - [Docker](#docker)
            - [Unix-based OS](#unix-based-os)
            - [Windows](#windows)
        - [Přímé spuštění](#pime-sputni)
    - [Adresářová struktura](#adresaova-struktura)
    - [Jak to celé funguje?](#jak-to-cele-funguje)
    - [Deployment](#deployment)
    - [Jak přispívat](#jak-pispivat)
        - [Git](#git)
        - [Správný commit](#spravn-commit)
        - [Pull requesty](#pull-requesty)


## Instalace

Existují dvě formy instalace, jednodušší je použití Docker engine, které funguje
všude. Web lze spustit i přímo bez Dockeru, ale v tom případě je vyžadován
Unix-based OS.

### Varianta 1 - Docker

Jediné co je potřeba nainstalovat je  Docker engine pro vaši platformu [na
oficiálním webu](https://docs.docker.com/install/). Docker engine funguje na
všech postatných platformách (Linux, macOS, Windows).

### Varianta 2 - Přímé spuštění

Vyžaduje Unix-based OS.

#### Fedora 25

##### Instalace závislostí

```
dnf install rubygem-jekyll
```

#### Ubuntu 16.04

##### Instalace závislostí

```
sudo apt-get install ruby2.3-dev gcc make libghc-zlib-dev libffi-dev
gem install rubygems-update
gem install jekyll bundler
bundle
npm install
```
#### macOS



##### Instalace závislostí

```
brew install rbenv
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```

##### Další postup

Znovu spustit Terminál. V repository adresáři pak spustit:

```
rbenv install 2.3.0-dev
rbenv local
gem install rubygems-update
gem install jekyll bundler
bundle
npm install
```

## Spuštění

### Docker

#### Unix-based OS

Otevřít terminal v adresáři webu a spustit:

```
docker-compose up
```

#### Windows

Otevřete
[PowerShell](https://365tipu.cz/2015/08/12/k-cemu-je-ve-windows-powershell-a-kde-ho-tam-najdu/)
v adresáři webu a postupně zadejte následující příkazy:

```
$Env:COMPOSE_CONVERT_WINDOWS_PATHS=1
docker-compose up
```

Web pak běží na [http://localhost:4000](http://localhost:4000/).

**Poznámka:** Je pravděpodobné, že Windows po vás budou chtít heslo k PC.

### Přímé spuštění

Otevřít terminal v adresáři webu a spustit:

```
npm start
```

Web pak běží na [http://localhost:4000](http://localhost:4000/).

## Adresářová struktura

```
├── _config.yml                     - konfigurační soubor
├── _data                           - yaml soubory nahrazující DB
├── _includes                       - html snippety (hlavička, patička, ...)
│   ├── footer.html                     -- patička stránky
│   ├── header.html                     -- hlavička stránky
│   └── head.html                       -- meta hlavička stránky
├── _layouts                        - šablony jednotlivých typů stránek
│   ├── blank.html                      -- zcela prázdná stránka
│   ├── compress.html                   -- layout, který komprimuje obsah
│   ├── default.html                    -- výchozí layout (použitelný pro většinu stránek)
│   ├── page.html                       -- běžná stránka, rozšiřuje default.html
│   └── post.html                       -- layout pro článek
├── _people                         - vlastní kolekce obsahující stránky jednotlivých osob
│   ├── osoba.md
│   └── ...
├── _posts                          - příspěvky v markdownu
├── _sass                           - SASS styly (konvertované do css)
│   ├── components                  - styly pro jednotlivé komponentové styly (footer, header, program, ...)
│   ├── objects                     - styly pro objekty
│   ├── utilities
│   ├── vendor                      - styly používaných knihoven (foundation, jquery-ui, ...)
│   ├── _base.scss                  - sem lze dát co jinam nepatří
│   └── _settings.scss              - konfigurace Foundation css
│
├── _site                           - vygenerovaná stránka
├── assets                          - přílohy (obrázky, pdf etc.)
│   └── img
├── aktuality                       - hlavní stránka aktuality
│   └── index.html
├── clenove                         - hlavní stránka seznamu členů
│   └── index.html
├── komunalni-volby-2018
│   ├── index.html                  - hlavní stránka a rozcestník pro komunální volby
│   ├── obvod-pardubice-i.html          -- stránky jednotlivých obvodů
│   └── obvod-pardubice-ii.html
├── kontakt
│   └── index.html                  - hlavní stránka kontakt
├── pripoj-se
│   └── index.html                  - hlavní stránka pro engagement
└── index.html                      - úvodní stránka / homepage
```

## Jak to celé funguje?

Výsledný web je staticky vygenerovaný za použití [Jekyllu](http://jekyllrb.com/). Během buildu (lokálního, nebo produkčního) se provede následující:

1. Kompilace JS dependencies (jQuery, jQuery UI)
2. Agregace CSS dependencies (Foundation, FontAwesome, jQuery UI)
3. Vyčištění cachí (`.jekyll-cache`)
4. Vyčištění `_site` adresáře
5. Spuštění Jekyll build commandu: `bundle exec jekyll build`

Produkční build má navíc ještě jeden krok,
[htmlproofer](https://github.com/gjtorikian/html-proofer), který ověří, že
všechny linky někam vedou.

## Deployment

Deployment momentálně funguje automaticky za použití Travis CI. Používají se
dvě branche:

- **master**: obsahuje testovací verzi webu
- **production**: obsahuje ostrou verzi webu

K nasazení dojde automaticky při pushi do jedné ze dvou větví. Potom automaticky
dojde k produkčnímu buildu a výsledek je pushnut na server pomocí `rsync`. Stav
builu lze sledovat v
[Travisu](https://travis-ci.org/pirati-web/pardubice.pirati.cz).

## Jak přispívat

Používáme technologii [Jekyll](http://jekyllrb.com/), která tvoří web ze
statických [šablonovaných (Liquid)](https://shopify.github.io/liquid/) stránek.
Díky tomu je vše velmi jednoduché:

- články jsou markdown soubory v adresaři `_posts`
- profily lidí z týmu jsou markdown soubory v adresaři `_pepople`
- programové body lze upravovat v `_program`
- stránky jsou klasické html soubory (mohou být i markdown)

### Git

Pro publikaci změn se používá Git. Ten rozděluje "změny" na tzv. commity.

Rychlé intro do Gitu lze najít [třeba tady](http://rogerdudler.github.io/git-guide/).
Pro obsluhu Gitu na GitHubu je nejsnazší si stáhnout [GitHub
Desktop](https://desktop.github.com/).

### Správný commit

Správný commit vždy:

- zachová funkčnost
- dodává 1 funcionalitu (např. nové menu)
- obsahuje popis z kterého je zřejmé, co mění (např.: *Rewrite main menu from Foundation 5 to Foundation 6*)

### Pull requesty

Pro zasílání změn ke správci webu je nejlepší používat tzv. [pull
requesty](https://help.github.com/articles/about-pull-requests/). Prvním krokem
je vytvoření vlastního [forku](https://help.github.com/articles/fork-a-repo/), tam si změny provedete a následně uděláte **pull
request**.

Probíhá to tedy takto:

1. Vytvoření vlastního forku
2. Provedení změn v kódu.
3. Vytvoření commitu. Kroky 2. a 3. mohou probíhat vícekrát.
4. Po dokončení všech úprav vytvoření pull requestu.
5. Pull request je schválen správce hlavního repository, tím jsou vaše změny provedeny.
