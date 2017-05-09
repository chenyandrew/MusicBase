# Feel free to define your own helper methods.
import psycopg2
from config import db

def connect():
    try:
        conn = psycopg2.connect(
            "dbname='" + db['DATABASE'] + "'" +
            "user='" + db['USER'] + "'" +
            "host='" + db['HOST'] + "'" +
            "password='" + db['PASSWORD'] + "'"
            )
        cursor = conn.cursor()
        return cursor
    except:
        return None

def print_table(table):
    print("\n====RESULT TABLE====")

    cols = len(table[0])
    format_string = "%s " * cols
    for row in table:
        print (format_string % tuple(row))
    print("====================\n")


def run_query(query, cursor):
    cursor.execute(query)
    rows = cursor.fetchall()
    colnames = [desc[0] for desc in cursor.description]
    rows.insert(0, colnames)
    return rows

def exmaple_one(cursor):
    query = "SELECT count(*) from actors"
    result = run_query(query, cursor)
    print_table(result)

def exmaple_two(cursor):
    year = input('Choose a year: ')
    query = "SELECT count(*) from movies where year = " + year + ";"
    result = run_query(query, cursor)
    print_table(result)

def exmaple_three(cursor):
    title = input('Choose a movie: ')

    query = "SELECT idmovies, title, year from movies where title = '" + title + "' ORDER BY year ASC;"
    movie_id_table = run_query(query, cursor)

    if len(movie_id_table) > 2:
        print_table(movie_id_table)
        movie_id = input('Pick a movie id: ')

        query = "SELECT character, fname, lname, genders FROM casts INNER JOIN actors on casts.idactors = actors.idactors where idmovies = " + movie_id + ";"
        result = run_query(query, cursor)

        print_table(result)
    else:
        print('No movie correspondes to the title: ' + title)

def query_one(cursor):

    query = "SELECT avg(num_movies) from (SELECT count(distinct idmovies) as num_movies from series where season is not null group by season order by season) movies_series;"
    result = run_query(query, cursor)
    print_table(result)

def query_two(cursor):

    year = (input("What year? "))
    query = "SELECT avg(cast(count_actors as float)) from (SELECT m.idmovies, m.year, count(c.idactors) as count_actors from cast_list c join movies m on c.idmovies = m.idmovies group by m.idmovies, m.year having m.year = " + year + ") cast_movies;"
    result = run_query(query,cursor)
    print_table(result)

def query_three(cursor):

    query = "SELECT lname, count(lname) from actors group by lname order by count(lname) desc limit(1);"
    result = run_query(query, cursor)
    print_table(result)

def query_four(cursor):

    fname = (input("Enter first name: "))
    lname = (input("Enter last name: "))

    fname = fname.lower()
    lname = lname.lower()

    fname = fname.capitalize()
    lname = lname.capitalize()

    query = "SELECT count(a.idactors) from actors a " + " right outer join cast_list c on a.idactors = c.idactors right outer join movies m on c.idmovies = m.idmovies " +  " where " + "a.fname = "+ "'"+fname+"'" + " and"+ " a.lname = " + "'"+lname+"'"+";"
    result = run_query(query, cursor)

    if len(result) > 1:
        print_table(result)
    else:
        print("Actor's name doesn't exist")



def query_five(cursor):

    query = "SELECT a.fname, a.lname, a.idactors from actors a inner join cast_list c on a.idactors = c.idactors where idseries is not null group by a.idactors, a.fname, a.lname limit(100);"
    result = run_query(query, cursor)
    print_table(result)

def query_six(cursor):

    year = input("What year: ")
    query = "SELECT year, count(idmovies) from movies where year is not null group by year having year = " + year + ";"
    result = run_query(query, cursor)
    print_table(result)

def query_seven(cursor):

    genre = input("Which genre? ")
    genre = genre.lower()
    genre = genre.capitalize()
    query = "SELECT year from (SELECT year, genre, max(count_genre) as most_popular from(SELECT m.year as year, g.genre as genre, count(g.genre) as count_genre from movies_genres mg join genres g on mg.idgenres = g.idgenres join movies m on mg.idmovies = m.idmovies group by m.year, g.genre order by count(g.genre) desc) movie_genre where genre = " + "'" + genre + "'" + " group by year, genre order by most_popular desc) most_popular_result limit(1);"
    result = run_query(query,cursor)
    print_table(result)

def query_eight(cursor):

    query = "SELECT avg(cast(count_series as float)) from (select count(s.idseries) as count_series from series s join movies m on s.idmovies = m.idmovies group by s.idmovies order by count(s.idseries) desc) series_list;"
    result = run_query(query, cursor)
    print_table(result)

def query_nine(cursor):

    query = "SELECT avg(cast(counts as float)) from (select count(idmovies_keywords) as counts, idmovies from movies_keywords where idmovies is not null group by idmovies) movies_keywords;"
    result = run_query(query, cursor)
    print_table(result)

def query_ten(cursor):

    query = "SELECT a.lname, count(a.lname) as num_actor_appearances from actors a join cast_list c on a.idactors = c.idactors join movies m on m.idmovies = c.idmovies group by m.idmovies, a.idactors, a.lname having a.lname is not null and m.idmovies is not null order by count(a.lname) desc limit(10);"
    result = run_query(query, cursor)
    print_table(result)
