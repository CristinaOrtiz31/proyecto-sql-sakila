# &#x20;          **PROYECTO SQL - BASE DE DATOS SAKILA**



##### **Descripción del proyecto**



Este proyecto consiste en la realización de consultas sobre la base de datos **Sakila,** que está relacionada con un sistema de alquiler de películas.

El objetivo principal de este proyecto es poner en práctica la teoría del módulo de SQL, tanto desde las consultas, la relación así como también el análisis de la información almacenada en la base de datos.



A lo largo del proyecto se han realizado consultad con distinto nivel de dificultad, comenzando por consultas sencillas y avanzando con consultas de agrupaciones, agregación, uso de los distintos tipos de JOIN, subconsultas, vistas y tablas temporales.



##### **Información del Proyecto**



Autora: Cristina Ortiz Espadas

Base de datos: Sakila

Fecha: 17/09/2026

Lenguaje: SQL

SGBD utilizado: PostgreSQL



##### **Objetivos**



Los principales objetivos del proyecto son:



Practicar consultas básicas mediante SELECT, WHERE y ORDER BY.

Utilizar filtros mediante operadores como BETWEEN, IN, NOT IN y LIKE.

Trabajar con funciones de agregación como COUNT, SUM, AVG, MIN y MAX.

Realizar agrupaciones mediante GROUP BY y filtrar resultados agrupados mediante HAVING.

Utilizar diferentes tipos de JOIN.

Trabajar con subconsultas.

Utilizar funciones para trabajar con cadenas y fechas.

Crear y consultar vistas.

Crear tablas temporales.

Utilizar CROSS JOIN.

Analizar información relacionada con películas, actores, clientes, alquileres y pagos.





##### **Base de datos Sakila**



Entre las tablas utilizadas durante el proyecto tenemos:



**Tabla	         Descripción**

film	        Contiene información sobre las películas

actor	        Contiene información sobre los actores

film\_actor	Relaciona actores con películas

category	Contiene las categorías de las películas

film\_category	Relaciona películas con categorías

language	Contiene los idiomas disponibles

inventory	Contiene las copias disponibles de las películas

rental	        Registra los alquileres realizados

customer	Contiene información sobre los clientes

payment	        Registra los pagos realizados

staff	        Contiene información sobre los trabajadores

store	        Contiene información sobre las tiendas



Estas tablas permiten relacionar diferentes partes de la información mediante claves y realizar consultas más completas.





##### **Contenido del proyecto** 



El proyecto contiene 64 puntos de ejercicios SQL, en los que se trabajan diferentes conceptos.



**1. Consultas básicas**



Se han realizado consultas para obtener información concreta de las tablas, utilizando:



* SELECT
* WHERE
* ORDER BY
* LIMIT
* DISTINCT



**2. Operadores y filtros**



Se han utilizado diferentes operadores para filtrar información:



* BETWEEN
* IN
* NOT IN
* LIKE
* ILIKE
* Operadores AND y OR
* Comparaciones con valores numéricos



Esto permite realizar búsquedas más específicas dentro de las tablas.



**3. Funciones de agregación**



El proyecto utiliza diferentes funciones de agregación para obtener información estadística:



* COUNT() para contar registros.
* SUM() para calcular totales.
* AVG() para calcular promedios.
* MIN() para obtener el valor mínimo.
* MAX() para obtener el valor máximo.
* VARIANCE() para calcular la varianza.
* STDDEV() para calcular la desviación estándar.



Estas funciones se han utilizado, entre otras cosas, para analizar la duración de las películas, los pagos y el número de alquileres.



**4. Agrupaciones**



Se han utilizado GROUP BY y HAVING para agrupar y filtrar información.



Algunos ejemplos son:



* Cantidad de películas por clasificación.
* Promedio de duración por categoría.
* Número de películas en las que participa cada actor.
* Número de alquileres realizados por cada cliente.
* Categorías cuyo promedio de duración supera un determinado valor.
* Películas que han sido alquiladas un número determinado de veces.



**5. JOIN**



Una parte importante del proyecto consiste en relacionar información de diferentes tablas.



Se han utilizado:



* INNER JOIN
* LEFT JOIN
* FULL JOIN
* CROSS JOIN



Los JOIN permiten relacionar, por ejemplo:



* Actores con películas.
* Películas con categorías.
* Películas con inventario.
* Inventario con alquileres.
* Alquileres con clientes.
* Clientes con pagos.
* Mostrar registros aunque no exista información relacionada.



**6. Subconsultas**



Se han utilizado subconsultas para realizar consultas cuyos resultados dependen de otra consulta.



Algunos ejemplos son:



* Buscar películas cuya duración sea superior a la duración media.
* Buscar películas cuyo precio de alquiler sea superior al precio medio.
* Buscar actores relacionados con películas alquiladas después de una determinada fecha.
* Buscar películas que tengan la misma duración que otra película.
* Utilizar EXISTS y NOT EXISTS para comprobar la existencia de registros relacionados.



**7. Consultas con fechas**



También se han realizado consultas relacionadas con fechas y alquileres.



Entre ellas:



* Contar alquileres por día.
* Contar alquileres por mes.
* Buscar alquileres realizados después de una determinada fecha.
* Buscar películas alquiladas durante más de 8 días.
* Obtener determinados alquileres según su posición temporal.



**8. Vistas**



En el punto 48 se crea una vista llamada actor\_num\_peliculas, esta vista permite consultar el nombre de cada actor junto con el número de películas en las que ha participado. Una vista permite guardar una consulta con un nombre para poder reutilizarla posteriormente. En PostgreSQL, la vista se define mediante CREATE VIEW y su consulta se ejecuta cuando se referencia la vista.



**9. Tablas temporales**



En el proyecto también se han creado tablas temporales para almacenar resultados de determinadas consultas.



Se han creado:



* cliente\_rentas\_temporal - almacena el número total de alquileres realizados por cada cliente.
* peliculas\_alquiladas - almacena las películas que han sido alquiladas al menos 10 veces.

&#x20;

Las tablas temporales permiten trabajar con resultados intermedios durante la sesión de trabajo. PostgreSQL permite crear este tipo de tablas mediante CREATE TEMPORARY TABLE.



**10. CROSS JOIN**



También se ha trabajado con CROSS JOIN, se ha realizado una combinación entre:



* film
* category



y otra entre:



* staff
* store



El CROSS JOIN genera todas las combinaciones posibles entre los registros de las dos tablas. Por este motivo, en el caso de películas y categorías, el resultado no representa necesariamente las relaciones reales existentes entre ellas.



##### **Ejecución del proyecto**



Para ejecutar el proyecto es necesario disponer de:



* PostgreSQL.
* La base de datos Sakila correctamente instalada.
* Un cliente SQL como pgAdmin, DBeaver u otra herramienta compatible con PostgreSQL.



Una vez instalada y cargada la base de datos Sakila, se puede abrir el archivo SQL y ejecutar las consultas correspondientes.



Es recomendable ejecutar las consultas en el orden indicado en el archivo, especialmente en los puntos donde se crean objetos como la vista o las tablas temporales.



##### **Conclusión**



La realización de este proyecto ha permitido practicar diferentes tipos de consultas SQL utilizando la base de datos Sakila.



Se han trabajado desde consultas sencillas para obtener información concreta hasta consultas más complejas que requieren relacionar varias tablas, realizar agrupaciones, utilizar funciones de agregación y crear subconsultas.



Además, se han utilizado elementos como vistas y tablas temporales, lo que permite trabajar con consultas reutilizables y resultados intermedios.



El proyecto permite aplicar de forma práctica diferentes conceptos fundamentales de SQL sobre una base de datos relacional.

