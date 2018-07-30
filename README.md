# example.pirati.cz

Tento web slouží jako výchozí stanice pro tvorbu dalších webu. Ať už regionálních nebo specializovaných celostátních.
Nebojte se cokoliv přiohnout, koukejte se do dalšich pirátských webů o featurach které se vám líbí a přidejte si je do svého.

## Obsah

- [Úvod](#intro)
- [Lokální spuštění](#install)
- [Souborová struktura](#file-structure)
- [Jednoduchá změna pomocí GitHub](#bfu-github)
- [Složitější změny](#development)
- [Vytvoření regionálního webu](#forking)
- [Získání pomoci](#getting-help)

## Úvod

Pirátská strana má své weby pro veřejnost statické a umístěné na vlastním serveru. 

Samotné texty a data jsou umístěné v GIT repozitářích jako je tento. Repozitář je taková
chytrá složka souborů. Chytrá je v tom, že si pamatuje veškerou historii umožňuje více
lidem pracovat zároveň a slučovat jejich práci. 

Repozitáře si můžete stáhnout (clone) na svůj počítač nebo k němu přistupovat pomocí githubu.
Z githubu se repozitář stahuje na naše servery.

Když dojde ke změně dat tak se na naších serverech repozitář zkompiluje. K tomu se používá Jekyll,
ten vezme soubory z aktulání verze repozitáře, přidá k nim soubory z 
[jekyll-theme-pirati](https://github.com/pirati-web/jekyll-theme-pirati) a vyrobí z nich samotné
html & css, které pak čte webový prohlížeč.

## Lokální spuštění

Instalace na Fedora 25:
```
sudo dnf group install "C Development Tools and Libraries"
sudo dnf install ruby-devel
sudo dnf install rubygem-jekyll
```

Instalace Ubuntu 16.04:

```
sudo apt-get install ruby-dev gcc make libghc-zlib-dev
gem install rubygems-update
gem install jekyll bundler
bundle
```

Repozitář můžeme naklonovat do jakékoliv složky (nemusí být ve `/var/www/`).

Po stažení nové verze může být potřeba:
`bundle install --path vendor/bundle`

Spustění je pomocí
`jekyll serve --watch --livereload`, což stránku zkompiluje, spustí a ještě je stránka přístupná skrz localhost: `http://127.0.0.1:4000`

Popřípadě můžeme spustit jen: `jekyll build`, což do složky `_site` připraví kompletní web (ten můžeme otevřít z prohlíže pomocí klavesové zkratky `ctrl+o`).

## Souborová struktura

### Pomocné soubory
* `Gemfile` se soubor "knihoven" které potřebuje Jekyll, nastavit v něm můžete např verzi thema které použijete. `Gemfile.lock` je pomocný soubor pro stejnou věc.
* `_config.yml` slouží jako hlavní návod pro Jekyll jak překládat, vyplňuji se v něm důležité texty a odkazy a taky nastavují některé parametry thema
* `Dockerfile` a `docker-compose.yml` slouží k lokálnímu spuštění webu.
* `README.md` je tento text.
* `_site` a `vendor` jsou složky viditelné jen při lokálním spuštení. V `_site` jsou výsledné html stránky. V `vendor` jsou uložené "knihovny".

### Data
* V `assets` budete použítat primárně složku `img` kam patří fotky a obrázky.
* `_posts`, `_people`, `_program` obsahují soubory s články, lidmi a programovými body. Soubory jsou vždy ve formátu markdown a na vrhchu mají `yml` hlavičku která je ohraničená `---`.
* Složka `_data` obsahuje soubory které jsou pouze tou hlavičkou. Kromě `yml` mohou obsahovat i `json`.  V `_data/menu.yml` se nastavují odkazy v horní liště, menu i na spodu stránky.

### Webové stránky
Samotné stránky jsou v markdownu nebo v html (složitější struktura, např. vícesloupců apod)
* `index.html` popisuje titulní stránky
* v dalších složkách jako je např `kontakt` nebo `lide` najdeme popis stránek, které budou na *example.pirati.cz/kontakt/* resp *example.pirati.cz/lide/* krom indexu tam lze přidávat další stránky pokud např v `komunalni-volby` přidáte soubor `harmonogram.md` ve správném formátu, tak vyrobíte stránku *example.pirati.cz/komunalni-volby/harmonogram.html*

## Jednoduchá změna pomocí GitHub

Rozlišujeme dva typy uživatelů. 
Prvními jsou lidé pouze zaregistrovaný na githubu může navrhnout změnu kdekoliv.
Druhými jsou správci (collaborants) ti můžou rovnou přispívat a schvalovat změny.

Pro jednoduché weby doporučujeme mít pouze dva správce,
jednoho 'editora' který na web dáva články informace a na začátku ho plnil a druhého
technicky zdatného, který řeší problémy a dělat velké změny. Ostatní přispěvatelé 
mohou navrhovat změny.

### Registrace na Githubu

Registrujte se [tady](https://github.com/join?source=header-home)
jako username doporučuji zvolit reálné jméno a přidat i fotku. Usnadníte tím práci editorům a celkovou spolupráci pirátu na webech.

### Drobná změna

Jako je např. oprava gramatické chyby nebo přidání telefoního čísla.

Najděte si daný soubor. Vpravo nahoře obsahu toho souboru je symbol tužky. Kliknětě a navrhněte změny. Pokud není naprosto jasné co děláte tak do commit message dole připište zdůvodnění. Dejte navrhnout úpravy a pak schválit merge request. Tj. je třeba kliknout dvakrát.

Existuje ještě elegantní trik jak se dostat k editaci: přímo na samotném webu najít vpravo dole tlačítko navrhnout změnu.

### Přidání textového souboru

Na githubu najeďte do složky, kam chcete soubor přidat, a klidněte na "create new file". Doporučuji si zároveň otevřít jiný soubor z dané složky, ať z něj můžete zkopírovat strukturu a vyměnit jenom data.

### Přidání fotky

Fotky může přidávat pouze 'editor'.

### Schválení změny

Na hlavní stránce nahoře je pole "merge request" - tam se nachází seznam návrhů. Projděte si je, rozklikejte je a po kontrole můžete kliknout na "merge pull request" a následně "confirm merge".

### Kontrola

Pokud děláte změny takto přes github, může dojít k chybě, které si hned nevšimnete. Proto je po změně potřeba zkontrolovat, že se vše povedlo. Nicméně buťte trpěliví, může trvat až pět minut než se změna projeví. Existují tři typy chyb:

- První je, že se něco viditelně rozbije - například zmizí kus textu a vy vidíte jen "tel" a za tím nic
- Druhý je, že se něco rozbije natolik, že web ani nejde přeložit. V tom případě zůstane ve staré verzi a vy nevidíte žádnou změnu.
- Třetí a nejhorší je, že nahrajete něco, co byste na pirati.cz vůbec neměli nahrávat. Tomu zabráníte jedině tak, že pečlivě kontrolujete commity a nepustíte dál žadnou změnu, které nerozumíte.

To, že něco pokazíte se může stát každému. Důležité je nebát si říct o pomoc a chybu napravit.

## Složitější změny

Tento web používá [jekyll-pirati-theme](https://github.com/jitka/jekyll-theme-pirati). Cokoliv z něj jde přepsat. Používejte co nejnovějši verzi. Verze se nastavuje v `Gemfile` a je zmíněna i v `assets` části `_config.yml`.

Pokud chcete zasahovat do JS nebo CSS tak si přečtete [dokumentaci thema](https://github.com/pirati-web/jekyll-theme-pirati/blob/master/development.md)

## Vytvoření regionálního webu

Pokud byste tuto šablonu chtěli využít pro tvorbu webu svého místního sdružení, změňte následující:

- v souboru `_config.yml` změňte hodnoty v horní části (title, description, url) a odkazy pod tím
- v adresáři `_people` odstraňte naše lidi a místo toho založte vlastní
- v adresáři `assets/img/people` dejte fotky vašich lidí
- v adresáři `_posts` odstraňte vzorový blogový příspěvek a dejte vlastní
- v adresáři `assets/img/posts` odstraňte naše fotky pro blogové příspěvky a dávejte vlastní
- v souboru `kontakty/index.md` upravte doporučené kontakty, zároveň u jednoho člověka v people vyplňte `category` `kontaktni_osoba`
- v souboru `lide/index.html` upravte text a obsah stránky `O nas`

### Titulní obrázek

Přidejte široký webový a úzký mobilní obrázek a nastavte parametry v `_config.yml`

### Kontaky na PiCe

V `_config.yml` vyplně adresu PiCe a obrázek. Následně v `kontakty/index.html` nastavte `residence: yes`.

### Více kandidátek

To je trošku tricky nastavení, pro inspiraci se podívejte do `jekyll-theme-pirati`.

### Kalednář

Doporučujeme si zjisti googleapikey vašeho kaledáře a doplnit ho do `_config.yml`, pak bude kalendář v designu, který odpovída zbytku webu
## Získání pomoci

Projděte si [návod na git](http://www.kutac.cz/blog/pocitace-a-internety/git-tutorialy-a-navody/) nebo 
[knížku v čestine](https://www.root.cz/knihy/pro-git/)

Jekyll má velmi podrobnou [dokumentaci](http://jekyllrb.com/docs/home/). A při vývoji též doporučuji [cheat sheet](http://jekyll.tips/jekyll-cheat-sheet/)

Example web používá [jekyll-pirati-theme](https://github.com/jitka/jekyll-theme-pirati). Cokoliv z něj jde přepsat. Používejte co nejnovějši verzi.

Technicky přesné dotazy můžete směřovat na TODO-issue-theme nebo [redmine](https://redmine.pirati.cz/projects/to/issues/new)

Na cokoliv se zeptejte třeba na [chatu](https://chat.pirati.cz/channel/tech-weby)

Ptejte se lidí okolo vás, kteří danou věc dělali, TO a dalších. Jak říkala moje prababička "Líná huba, holé neštěstí".
