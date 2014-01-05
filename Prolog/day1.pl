/* knowledge base of favorite authors and books */

wrote(vonnegut, cats_cradle).
wrote(vonnegut, slaughterhouse_five).
wrote(stephenson, diamond_age).
wrote(stephenson, anathem).
wrote(twain, puddnhead_wilson).
wrote(twain, roughing_it).
wrote(wilde, picture_of_dorian_grey).
wrote(swift, gullivers_travels).

/* typed at console:
?- wrote(stephenson, Book).
Book = diamond_age ;
Book = anathem.
*/



/* knowledge base of musicians, instruments, and genres */

plays(homme, guitar).
plays(grohl, drums).
plays(dale, guitar).
plays(reinhardt, guitar).
plays(coltrane, saxophone).
plays(armstrong, trumpet).
plays(claypool, bass).
plays(alpert, trumpet).

genre(alpert, latin).
genre(homme, stoner_rock).
genre(grohl, rock).
genre(reinhardt, gypsy_jazz).
genre(dale, surf_rock).
genre(coltrane, jazz).
genre(armstrong, jazz).
genre(claypool, experimental).

/* typed at console:
?- plays(Artist, guitar).
Artist = homme ;
Artist = dale ;
Artist = reinhardt.
*/

