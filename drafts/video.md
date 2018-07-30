---
date: 2018-06-10
category: blog
tags: tag1 tag2
layout: post
title: Článek s vložený videem uvnitř textu
author: Jmeno Prijmeni
authorId: jakub.pirat    # uid nekoho z _people (nepoviné)
image: posts/obrazek.u.tohoto.postu.jpg
---

Posty musí být každý ve vlastním souboru pojmenovaném datumem a nejakym nazvem, například _posts/2018-03-14-slavime-pi-day.md. Tento název se pak objeví v adrese, tedy xxx.pirati.cz/aktuality/slavime-pi-day.html.

Obrázky dávejte do assets/img/posts/

# Struktura

* texty pište v *Markdown*
* viz [wikipedia](https://cs.wikipedia.org/wiki/Markdown)

<hr>

# Youtube

Lze embeddovat pomocí vložení:

```{% raw %}{% include youtube.html id='id youtube videa' %}{% endraw %}```

Výsledek pak vypadá takto:

{% include youtube.html id='5f0-nQLHHM4' %}



# Ukázky typografie

# Nadpis 1

## Nadpis 2

### Nadpis 3

#### Nadpis 4

Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Etiam commodo
dui eget wisi. Cras elementum. Etiam dictum tincidunt diam. Aliquam erat
volutpat. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et,
dolor. Aliquam erat volutpat. Etiam ligula pede, sagittis quis, interdum
ultricies, scelerisque eu. Cras elementum. Vestibulum fermentum tortor id mi.
Etiam quis quam. Mauris elementum mauris vitae tortor. Fusce tellus. Integer
rutrum, orci vestibulum ullamcorper ultricies, lacus quam ultricies odio, vitae
placerat pede sem sit amet enim. Ut enim ad minima veniam, quis nostrum
exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
consequatur?

# Nadpis 1

Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Etiam commodo
dui eget wisi. Cras elementum. Etiam dictum tincidunt diam. Aliquam erat
volutpat. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et,
dolor. Aliquam erat volutpat.

## Nadpis 2

Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Etiam commodo
dui eget wisi. Cras elementum. Etiam dictum tincidunt diam. Aliquam erat
volutpat. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et,
dolor. Aliquam erat volutpat.

### Nadpis 3

Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Etiam commodo
dui eget wisi. Cras elementum. Etiam dictum tincidunt diam. Aliquam erat
volutpat. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et,
dolor. Aliquam erat volutpat.

#### Nadpis 4

Nullam lectus justo, vulputate eget mollis sed, tempor sed magna. Etiam commodo
dui eget wisi. Cras elementum. Etiam dictum tincidunt diam. Aliquam erat
volutpat. Duis sapien nunc, commodo et, interdum suscipit, sollicitudin et,
dolor. Aliquam erat volutpat.

# Nečíslovaný seznam

* Quisque porta. Nulla pulvinar eleifend sem.
* Quisque porta. Nulla pulvinar eleifend sem.
* Quisque porta. Nulla pulvinar eleifend sem.
* Quisque porta. Nulla pulvinar eleifend sem.

# Číslovaný seznam

1. Quisque porta. Nulla pulvinar eleifend sem.
2. Quisque porta. Nulla pulvinar eleifend sem.
3. Quisque porta. Nulla pulvinar eleifend sem.
4. Quisque porta. Nulla pulvinar eleifend sem.

# Senznam uvnitř textu

Quisque porta. Nulla pulvinar eleifend sem. Praesent id justo in neque elementum
ultrices. Aliquam erat volutpat. Etiam dictum tincidunt diam. Itaque earum rerum
hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias
consequatur aut perferendis doloribus asperiores repellat. Fusce tellus odio,
dapibus id fermentum quis, suscipit id erat. Vestibulum erat nulla, ullamcorper
nec, rutrum non, nonummy ac, erat. Nulla est. Donec iaculis gravida nulla.

1. Quisque porta. Nulla pulvinar eleifend sem.
2. Quisque porta. Nulla pulvinar eleifend sem.
3. Quisque porta. Nulla pulvinar eleifend sem.
4. Quisque porta. Nulla pulvinar eleifend sem.

Vivamus porttitor turpis ac leo. [Aliquam](https://example.com) ante. Nullam justo enim, consectetuer
nec, ullamcorper ac, vestibulum in, elit. Maecenas libero. Aliquam ornare wisi
eu metus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis
bibendum, lectus ut viverra rhoncus, dolor nunc faucibus libero, eget facilisis
enim ipsum id lacus. Nunc auctor. Fusce dui leo, imperdiet in, aliquam sit amet,
feugiat eu, orci. Vestibulum fermentum tortor id mi. In dapibus augue non
sapien. Mauris elementum mauris vitae tortor.

# Tabulka

Vivamus luctus egestas leo.
Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Mauris dictum
facilisis augue. Aenean placerat. Nullam lectus justo, vulputate eget mollis
sed, tempor sed magna. Nullam feugiat, turpis at pulvinar vulputate, erat libero
tristique tellus, nec bibendum odio risus sit amet ante. Fusce wisi. Phasellus
enim erat, vestibulum vel, aliquam a, posuere eu, velit.

<table>
  <tr>
    <td>Vivamus porttitor turpis ac leo.</td>
    <td>Integer vulputate sem a nibh rutrum consequat.</td>
    <td>Integer tempor.</td>
  </tr>
  <tr>
    <td>Vivamus porttitor turpis ac leo.</td>
    <td>Integer vulputate sem a nibh rutrum consequat.</td>
    <td>Integer tempor.</td>
  </tr>
  <tr>
    <td>Vivamus porttitor turpis ac leo.</td>
    <td>Integer vulputate sem a nibh rutrum consequat.</td>
    <td>Integer tempor.</td>
  </tr>
  <tr>
    <td>Vivamus porttitor turpis ac leo.</td>
    <td>Integer vulputate sem a nibh rutrum consequat.</td>
    <td>Integer tempor.</td>
  </tr>
</table>

Cras elementum. Integer vulputate sem a nibh rutrum consequat. Integer tempor.
Donec iaculis gravida nulla. Donec quis nibh at felis congue commodo. Vivamus
porttitor turpis ac leo. Vivamus luctus egestas leo. Donec ipsum massa,
ullamcorper in, auctor et, scelerisque sed, est. Phasellus rhoncus. Nam sed
tellus id magna elementum tincidunt. Neque porro quisquam est, qui dolorem ipsum
quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi
tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Duis
ante orci, molestie vitae vehicula venenatis, tincidunt ac pede.


- - -
