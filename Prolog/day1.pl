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
genre(homme, stoner_rock).
plays(grohl, drums).
genre(grohl, rock).
plays(dale, guitar).
genre(dale, surf_rock).
plays(reinhardt, guitar).
genre(reinhardt, gypsy_jazz).
plays(coltrane, saxophone).
genre(coltrane, jazz).
plays(armstrong, trumpet).
genre(armstrong, jazz).
plays(claypool, bass).
genre(claypool, experimental).
plays(alpert, trumpet).
genre(alpert, latin).

/* typed at console:
?- plays(Artist, guitar).
Artist = homme ;
Artist = dale ;
Artist = reinhardt.
*/

