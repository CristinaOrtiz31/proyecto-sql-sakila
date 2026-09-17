-- ===========================================
-- PROYECTO SQL
-- Base de datos: Sakila
-- Autor: Cristina Ortiz Espadas
-- Fecha: 28/07/2026
-- ===========================================

-- ===========================================
-- PUNTO 2
-- Muestra los nombres de todas las películas
-- con una clasificación por edades de 'R'.
-- ===========================================

select f.title, f.rating 
from film f 
where rating = 'R';

-- ===========================================
-- PUNTO 3
-- Encuentra los nombres de los actores que
-- tengan un actor_id entre 30 y 40.
-- ===========================================

select first_name , last_name, actor_id 
from actor
where actor_id between 30 and 40;

-- ===========================================
-- PUNTO 4
-- Obtén las películas cuyo idioma coincide
-- con el idioma original.
-- ===========================================

select f.title 
from film f 
where f.language_id = f.original_language_id ;

-- ===========================================
-- PUNTO 5
-- Ordena las películas por duración
-- de forma ascendente.
-- ===========================================

select f.title, f.length 
from film f 
order by f.length  asc;

-- ===========================================
-- PUNTO 6
-- Encuentra el nombre y apellido de los actores
-- que tengan 'Allen' en su apellido.
-- ===========================================

select a.first_name, a.last_name 
from actor a 
where a.last_name = 'Allen';

-- ===========================================
-- PUNTO 7
-- Encuentra la cantidad total de películas en cada clasificación de la tabla
-- “film” y muestra la clasificación junto con el recuento.
-- ===========================================

select 
      f.rating as clasificacion,
       count(*) as cantidad_peliculas
from film f 
group by f.rating;

-- ===========================================
-- PUNTO 8
-- Encuentra el título de todas las películas que son ‘PG-13’ o tienen una
-- duración mayor a 3 horas en la tabla film.
-- ===========================================

select f.title, f.length 
from film f 
where f.rating  = 'PG-13' or length > 180;

-- ===========================================
-- PUNTO 9
-- Encuentra la variabilidad de lo que costaría reemplazar las películas.
-- ===========================================

select variance(f.replacement_cost )
from film f ;

-- ===========================================
-- PUNTO 10
-- Encuentra la mayor y menor duración de una película de nuestra BBDD
-- ===========================================

select 
      Min(f.length ) as "Menor_duracion", Max(f.length ) as "Mayor_duracion"
from film f ;

-- ===========================================
-- PUNTO 11
-- Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
-- ===========================================

select p.amount 
from rental r 
join payment p 
on  r.rental_id = p.rental_id 
order by r.rental_date desc, r.rental_id desc
limit 1 offset 2;

-- ===========================================
-- "Porque había varios alquileres con la misma rental_date. Añadí rental_id 
-- como segundo criterio para desempatar y obtener un único antepenúltimo alquiler."
-- ===========================================

-- ===========================================
-- PUNTO 12
--  Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-
--  17ʼ ni ‘Gʼ en cuanto a su clasificación.
-- ===========================================

select f.title , f.rating 
from film f 
where f.rating not in ('NC-17', 'G');

-- ===========================================
-- PUNTO 13
--  Encuentra el promedio de duración de las películas para cada 
--  clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
-- ===========================================

select
     rating as clasificacion,
     avg("length") as promedio_de_duracion
from film f 
group by f.rating ;

-- ===========================================
-- PUNTO 14
--  Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
-- ===========================================

select f.title, f.length 
from film f 
where f.length > 180;

-- ===========================================
-- PUNTO 15
--  ¿Cuánto dinero ha generado en total la empresa?
-- ===========================================

select sum (amount) as Total_dinero_generado
from payment p ;

-- ===========================================
-- PUNTO 16
-- Muestra los 10 clientes con mayor valor de id.
-- ===========================================

select c.first_name , c.last_name , c.customer_id 
from customer c 
order by c.customer_id  desc 
limit 10;

-- ===========================================
-- PUNTO 17
--  Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ.
-- ===========================================

select a.first_name , a.last_name 
from actor a 
join film_actor fa 
on a.actor_id = fa.actor_id 
join film f 
on fa.film_id = f.film_id 
where f.title = 'Egg Igby';

-- La consulta no devuelve resultados.
-- Compruebo si el título de la película existe en la tabla film.

select f.title 
from film f 
where f.title = 'EGG IGBY';
-- Verificación: el título en la base de datos es 'EGG IGBY', no 'Egg Igby'.

-- ===========================================
-- PUNTO 18
--  Selecciona todos los nombres de las películas únicos.
-- ===========================================

select distinct f.title 
from film f ;

-- ===========================================
-- PUNTO 19
-- Encuentra el título de las películas que son comedias y tienen una 
-- duración mayor a 180 minutos en la tabla “filmˮ.
-- ===========================================

select f.title, f.length, c.name
from film f 
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
where length > 180 and c."name" = 'Comedy';

-- ===========================================
-- PUNTO 20
-- Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría 
-- junto con el promedio de duración.
-- ===========================================

select 
     c."name" as Nombre_Categoria,
     AVG( length) as "Promedio_Duracion"
from category c 
join film_category fc 
on c.category_id = fc.category_id 
join film f 
on fc.film_id = f.film_id 
group by c."name" 
Having AVG( length)>110;

-- ===========================================
-- PUNTO 21
--  ¿Cuál es la media de duración del alquiler de las películas?
-- ===========================================

select
      AVG(rental_duration  ) as Duracion_Media_Alquiler
from film;

-- ===========================================
-- PUNTO 22
-- Crea una columna con el nombre y apellidos de todos los actores y 
-- actrices.
-- ===========================================

select
      concat(a.first_name ,' ', a.last_name)  as Nombres_y_Apellidos_de_todos_los_actores
from actor a;

-- ===========================================
-- PUNTO 23
-- Números de alquiler por día, ordenados por cantidad de alquiler de 
-- forma descendente.
-- ===========================================

select r.rental_date,
  count(*)as Alquiler_por_dia
from rental r 
group by r.rental_date 
order by alquiler_por_dia  desc;

-- ===========================================
-- PUNTO 24
--  Encuentra las películas con una duración superior al promedio.
-- ===========================================

select f.title, f.length 
from film f 
where f.length > (
      select AVG (length )
      from film
);

-- ===========================================
-- PUNTO 25
-- Averigua el número de alquileres registrados por mes.
-- ===========================================

select
     extract(month from rental_date) as mes,
     count(*) as Numero_de_alquileres
from rental
group by extract(month from rental_date)
order by mes;

-- ===========================================
-- PUNTO 26
-- Encuentra el promedio, la desviación estándar y varianza del total 
-- pagado.
-- ===========================================

select
     avg (amount) as promedio,
     stddev(amount) as desviacion_estandar,
     variance(amount) as varianza
from payment p ;

-- ===========================================
-- PUNTO 27
--  ¿Qué películas se alquilan por encima del precio medio?
-- ===========================================


select title 
from film 
where rental_rate > (
     select
     AVG(rental_rate )
     from film
);

-- ===========================================
-- PUNTO 28
-- Muestra el id de los actores que hayan participado en más de 40 
-- películas.
-- ===========================================

select 
       fa.actor_id,
       count(*) as numero_de_peliculas
from film_actor fa 
group by fa.actor_id 
having count(*) >40 ;

-- ===========================================
-- PUNTO 29
-- Obtener todas las películas y, si están disponibles en el inventario, 
-- mostrar la cantidad disponible.

select 
      title,
      count(i.inventory_id )as cantidad_disponible
from film
left join inventory i 
on film.film_id = i.film_id 
group by film.film_id , title  ;


-- ===========================================
-- PUNTO 30
-- Obtener los actores y el número de películas en las que ha actuado.
-- ===========================================

select
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS numero_peliculas
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by a.actor_id , a.first_name , a.last_name ;

-- ===========================================
-- PUNTO 31
-- Obtener todas las películas y mostrar los actores que han actuado en 
-- ellas, incluso si algunas películas no tienen actores asociados.
-- ===========================================

select f.title, a.first_name, a.last_name 
from film f 
left join film_actor fa 
       on f.film_id = fa.film_id 
left join actor a 
       on fa.actor_id = a.actor_id;

-- ===========================================
-- PUNTO 32
-- Obtener todos los actores y mostrar las películas en las que han 
-- actuado, incluso si algunos actores no han actuado en ninguna película.
-- ===========================================

select a.first_name, a.last_name , f.title 
from actor a 
left join film_actor fa 
       on a.actor_id = fa.actor_id 
left join film f 
       on fa.film_id = f.film_id ;

-- ===========================================
-- PUNTO 33
-- Obtener todas las películas que tenemos y todos los registros de 
--alquiler.
-- ===========================================

select *
from film f 
full join inventory i 
       on f.film_id = i.film_id 
full join rental r 
       on i.inventory_id = r.inventory_id ;

-- ===========================================
-- PUNTO 34
-- Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
-- ===========================================


select 
   c.first_name, c.last_name,
   SUM (p.amount) as Total_Gastado
from customer c 
join payment p 
  on c.customer_id = p.customer_id 
group by c.customer_id, c.first_name, c.last_name 
order by Total_Gastado desc 
limit 5;

-- ===========================================
-- PUNTO 35
--  Selecciona todos los actores cuyo primer nombre es 'Johnny'.
-- ===========================================

select a.first_name , a.last_name 
from actor a 
where a.first_name = 'Johnny';

-- También podría hacerse asi --

select a.first_name , a.last_name 
from actor a 
where a.first_name = 'Johnny';


-- ===========================================
-- PUNTO 36
-- Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como 
-- Apellido.
-- ===========================================

select 
      a.first_name as Nombre,
      a.last_name as Apellido
from actor a ;

-- ===========================================
-- PUNTO 37
-- Encuentra el ID del actor más bajo y más alto en la tabla actor.
-- ===========================================

select 
     min (a.actor_id ) as Id_mas_bajo,
     max ( a.actor_id) as Id_mas_alto
from actor a ;

-- ===========================================
-- PUNTO 38
-- Cuenta cuántos actores hay en la tabla “actorˮ.
-- ===========================================

select
     count(*) as Total_actores
from actor;

-- ===========================================
-- PUNTO 39
-- Selecciona todos los actores y ordénalos por apellido en orden 
-- ascendente.
-- ===========================================

select last_name , first_name 
from actor
order by actor.last_name asc ;

-- ===========================================
-- PUNTO 40
-- Selecciona las primeras 5 películas de la tabla “filmˮ.
-- ===========================================

select f.title 
from film f 
order by f.film_id 
limit 5;

-- ===========================================
-- PUNTO 41
-- Agrupa los actores por su nombre y cuenta cuántos actores tienen el 
-- mismo nombre. ¿Cuál es el nombre más repetido?.
-- ===========================================

select
      a.first_name,
      count(*) as Cantidad
from actor a 
group by a.first_name
order by cantidad desc 
limit 1;


-- ===========================================
-- PUNTO 42
--  Encuentra todos los alquileres y los nombres de los clientes que los 
-- realizaron.
-- ===========================================

select rental_id  , c.first_name , c.last_name 
from rental  
join customer c 
  on rental.customer_id = c.customer_id ;

-- ===========================================
-- PUNTO 43
-- Muestra todos los clientes y sus alquileres si existen, incluyendo 
-- aquellos que no tienen alquileres.
-- ===========================================

select first_name , last_name , rental_id 
from customer
left join rental
       on customer.customer_id = rental.customer_id ;

-- ===========================================
-- PUNTO 44
--  Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor 
-- esta consulta? ¿Por qué? Deja después de la consulta la contestación.
-- ===========================================

select*
from category c 
cross join film f ;
-- ¿Aporta valor esta consulta? 
-- No realmente.
--¿Por qué?
-- El Cross Join obtiene todas las combinaciones posibles y en este caso
-- incluso algunas que no existen, por lo que el resultado no refleja la relacion real entre 
-- peliculas y categorías, por lo que en esta aplicación la consulta no aporta información útil.

-- ===========================================
-- PUNTO 45
-- Encuentra los actores que han participado en películas de la categoría 'Action'.
-- ===========================================

select distinct a.first_name , a.last_name 
from actor a 
join film_actor fa 
  on a.actor_id = fa.actor_id 
join film f 
  on fa.film_id = f.film_id 
join film_category fc 
  on f.film_id = fc.film_id 
join category c 
  on fc.category_id = c.category_id 
where c."name" = 'Action';

-- ===========================================
-- PUNTO 46
--  Encuentra todos los actores que no han participado en películas.
-- ===========================================

select a.first_name , a.last_name
from actor a 
left join film_actor fa 
       on a.actor_id = fa.actor_id 
where fa.film_id  is null;

-- ===========================================
-- PUNTO 47
-- Selecciona el nombre de los actores y la cantidad de películas en las 
-- que han participado.
-- ===========================================

select
      first_name , last_name , 
  count( fa.film_id ) as Cantidad_de_peliculas
from actor
join film_actor fa 
  on actor.actor_id = fa.actor_id 
group by first_name , actor.last_name , actor.actor_id   ;

-- ===========================================
-- PUNTO 48
-- Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres 
-- de los actores y el número de películas en las que han participado. 

create view actor_num_peliculas as 
select
      first_name , last_name , 
  count( fa.film_id ) as Cantidad_de_peliculas
from actor
join film_actor fa 
  on actor.actor_id = fa.actor_id 
group by first_name , actor.last_name , actor.actor_id   ;
 
-- Para visualizar el contenido de la vista creada, ejecutamos la siguiente consulta :

select* 
from actor_num_peliculas;

-- ===========================================
-- PUNTO 49
-- Calcula el número total de alquileres realizados por cada cliente.
-- ===========================================

select 
     c.first_name , c.last_name,
  count(r.rental_id ) as Numero_total_de_alquileres
from customer c 
join rental r 
  on  c.customer_id = r.customer_id 
group by  c.first_name , c.last_name  , c.customer_id ;

-- ===========================================
-- PUNTO 50
-- Calcula la duración total de las películas en la categoría 'Action'.
-- ===========================================

select
    SUM(f.length )as duracion_total_de_las_peliculas
from film f 
join film_category fc 
  on f.film_id = fc.film_id 
join category c 
  on fc.category_id = c.category_id 
where c."name" = 'Action';

-- ===========================================
-- PUNTO 51
-- Crea una tabla temporal llamada “cliente_rentas_temporalˮ para 
-- almacenar el total de alquileres por cliente.
-- ===========================================

create temporary table cliente_rentas_temporal as
select
     c.first_name , c.last_name,
     count(r.rental_id ) as Numero_total_de_alquileres
from customer c 
join rental r 
  on c.customer_id = r.customer_id 
group by  c.first_name , c.last_name  , c.customer_id;

-- Comprobación --
select*
from cliente_rentas_temporal;

-- ===========================================
-- PUNTO 52
-- Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las 
-- películas que han sido alquiladas al menos 10 veces.
-- ===========================================

create temporary table peliculas_alquiladas as
select f.title,
      count(r.rental_id ) as Numero_de_alquileres
from film f 
join inventory i 
  on f.film_id = i.film_id 
join rental r 
  on i.inventory_id = r.inventory_id 
group by f.film_id , f.title  
having count(r.rental_id ) >= 10;

-- Comprobación --
select *
from peliculas_alquiladas;

-- ===========================================
-- PUNTO 53
-- Encuentra el título de las películas que han sido alquiladas por el cliente 
-- con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. Ordena 
-- los resultados alfabéticamente por título de película.
-- ===========================================

select  title
from film f 
join inventory i 
  on f.film_id = i.film_id 
join rental r 
  on i.inventory_id = r.inventory_id 
join customer c 
  on r.customer_id = c.customer_id 
where r.return_date is null 
     and c.first_name  = 'Tammy'
     and c.last_name = 'Sanders'
order by f.title ;

-- ===========================================
-- PUNTO 54
-- Encuentra los nombres de los actores que han actuado en al menos una 
-- película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados 
-- alfabéticamente por apellido.
-- ===========================================

select a.first_name , a.last_name 
from actor a 
join film_actor fa 
  on a.actor_id = fa.actor_id 
join film f 
  on fa.film_id = f.film_id 
join film_category fc 
  on f.film_id = fc.film_id 
join category c 
  on fc.category_id = c.category_id 
where c."name" = 'Sci-Fi'
order by  a.last_name ;

-- ===========================================
-- PUNTO 55
--  Encuentra el nombre y apellido de los actores que han actuado en 
-- películas que se alquilaron después de que la película ‘Spartacus 
-- Cheaperʼ se alquilara por primera vez. Ordena los resultados 
-- alfabéticamente por apellido.
-- ===========================================

select distinct a.first_name, a.last_name
from actor a
join film_actor fa
  on a.actor_id = fa.actor_id
join inventory i
  On fa.film_id = i.film_id
join rental r
  on i.inventory_id = r.inventory_id
where r.rental_date > (
    select  MIN(r2.rental_date)
    from rental r2
    join inventory i2
      on r2.inventory_id = i2.inventory_id
    join film f2
      on i2.film_id = f2.film_id
    where f2.title ilike 'Spartacus Cheaper'
)
order by a.last_name;

-- ===========================================
-- PUNTO 56
-- Encuentra el nombre y apellido de los actores que no han actuado en 
-- ninguna pelicula de la categoria 'Music'.
-- ===========================================
select a.first_name, a.last_name
froM actor a
where not existS (
    select 1
   froM film_actor fa
    join film f
      on fa.film_id = f.film_id
    join film_category fc
      on f.film_id = fc.film_id
    join category c
      on fc.category_id = c.category_id
    where fa.actor_id = a.actor_id
      and c.name = 'Music'
)
order by a.last_name;
-- ===========================================
-- PUNTO 57
-- Encuentra el título de todas las películas que fueron alquiladas por más 
-- de 8 dias.
-- ===========================================
select distinct f.title 
from film f 
join inventory i 
  on f.film_id = i.film_id 
join rental r 
  on i.inventory_id = r.inventory_id 
where  r.return_date - r.rental_date > interval '8 days';

-- ===========================================
-- PUNTO 58
-- Encuentra el título de todas las películas que son de la misma categoría
-- que 'Animation'.
select f.title, c."name"  
from film f 
join film_category fc 
  on f.film_id = fc.film_id 
join category c 
  on fc.category_id = c.category_id 
where c."name" = 'Animation';

-- ===========================================
-- PUNTO 59
-- Encuentra los nombres de las películas que tienen la misma duración 
-- que la película con el título ‘Dancing Feverʼ. Ordena los resultados 
-- alfabéticamente por título de película.
-- ===========================================

select f.title, f.length 
from film f 
where f.length = (
     select f2.length 
     from film f2 
     where f2.title ilike 'Dancing Fever'
)
order by f.title asc;

-- ===========================================
-- PUNTO 60
--  Encuentra los nombres de los clientes que han alquilado al menos 7 
-- películas distintas. Ordena los resultados alfabéticamente por apellido.
-- ===========================================
select c.first_name , c.last_name 
from customer c 
join rental r 
  on c.customer_id = r.customer_id 
join inventory i 
  on r.inventory_id = i.inventory_id 
join film f 
  on i.film_id = f.film_id 
group by c.customer_id , c.first_name , c.last_name 
having count (distinct f.film_id ) >= 7
order by c.last_name asc;

-- ===========================================
-- PUNTO 61
-- Encuentra la cantidad total de películas alquiladas por categoría y 
-- muestra el nombre de la categoría junto con el recuento de alquileres.
-- ===========================================

select c."name" ,
  count( rental_id ) as Numero_de_Alquileres
from category c 
join film_category fc 
  on c.category_id = fc.category_id 
join film 
  on fc.film_id = film.film_id 
join inventory i 
  on film.film_id = i.film_id 
join rental 
  on i.inventory_id = rental.inventory_id 
group by c."name" ;

-- ===========================================
-- PUNTO 62
-- Encuentra el número de películas por categoría estrenadas en 2006.
-- ===========================================

select 
     count (f.film_id ) as Numero_de_Peliculas, c."name" as Nombre_Categoria
from category c 
join film_category fc 
  on c.category_id = fc.category_id 
join film f 
  on fc.film_id = f.film_id 
where f.release_year = '2006'
group by c."name" ;

-- ===========================================
-- PUNTO 63
-- Obtén todas las combinaciones posibles de trabajadores con las tiendas 
-- que tenemos.
-- ===========================================
select*
from staff s 
cross join store s2 ;

-- ===========================================
-- PUNTO 64
-- Encuentra la cantidad total de películas alquiladas por cada cliente y 
-- muestra el ID del cliente, su nombre y apellido junto con la cantidad de 
-- películas alquiladas.
-- ===========================================

select c.customer_id , c.first_name , c.last_name,
    count( r.rental_id) as Cantidad_total_de_peliculas_alquiladas
from film f 
join inventory i 
  on f.film_id = i.film_id 
join rental r 
  on i.inventory_id = r.inventory_id 
join customer c 
  on r.customer_id = c.customer_id
group by c.customer_id, c.first_name , c.last_name ;
