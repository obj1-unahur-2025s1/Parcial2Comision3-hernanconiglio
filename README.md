[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/kvKIMoRM)
# 🧠 Parcial 2 Comisión 3 – Objetos 1 – Unahur – 2025 – Primer Cuatrimestre

## Dominio: Influencers, Plataformas y Streams
En la actualidad, las redes sociales y las plataformas de streaming dominan el mundo del entretenimiento. Queremos modelar el ecosistema de influencers, plataformas y transmisiones en vivo (streams), de manera que podamos entender sus comportamientos, interacciones y evolución.

## 🧑‍💻Escenario
Cada Influencer pertenece a una plataforma principal (como Twitch, YouTube o Kick), y puede realizar diferentes tipos de streams que le permiten ganar seguidores.
Los tipos de streams disponibles actualmente son:

- 🎮 Gaming: Transmiten videojuegos. El impacto del stream se calcula como el nivel de habilidad gaming del influencer multiplicado por 5.


- 💬 Charla: Streams más relajados y conversacionales. El impacto se calcula como la elocuencia del influencer multiplicada por 6 más un adicional que depende de la clasificación de la charla por tipo de público; Inicialmente consideramos estas 3, pero en el futuro podría haber más: 
    - ATP (Aptas para todo público): suman 5 por cada stream.
    - +13: suman 3.
    - +16: no suman.


-  🎨 Creativo: Pintura, música, cocina, etc, no se necesita indicarle un tipo específico. El impacto es el promedio entre el carisma y la elocuencia del influencer, multiplicado por 8.


Cada influencer tiene las siguientes características:
- carisma (0 a 100)
- elocuencia (0 a 100)
- habilidad gaming (0 a 100)


También se conoce su alias (es un string) que debe ser único en la plataforma y no puede cambiarlo. 
Por ahora se conocen 3 tipos de Influencer según su rol (en el futuro podrían surgir nuevos) se detallan a continuación:

- **Streamer profesional**: Estos streamer siempre hacen streams del mismo tipo (o gaming, charla, creativo, o alguno nuevo que surja) Para que un influencer pueda ser streamer profesional, debe tener una cantidad de seguidores mayor al mínimo requerido, que es un valor que puede cambiar en cualquier momento, y es establecido por el IGBA (Influencer Global Benchmark Authority). Se deberá arrojar un error si se intenta registrar un influencer con este rol que no cumple el requisito. 

- **Creador multifacético**: Puede elegir el tipo de stream preferido, cualquiera de los existentes y cambiarlo las veces que quiera y según como le pinte

- **Influencer comercial**: Hace el stream que más seguidores potencialmente le puede generar según sus atributos (características) de entre los tipos de streams que sabe hacer. Para registrar un influencer de este tipo debe saber al menos 1 tipo de stream. Para aprender un nuevo tipo de stream que aún no sabe, este influencer debe realizar un stream de adquisición (indicando el tipo de stream), lo que le permite agregar el tipo de stream como aprendido y en ese proceso pierde el 10% de los seguidores que posee. Este stream no queda registrado en ninguna plataforma.



## 🧩 Plataformas
Cada plataforma (como Twitch, IG, etc.) permite registrar a sus influencers, y tal como se especificó más arriba, no puede haber 2 influencers con el mismo alias. Las plataformas pueden ser:
- **Abiertas**: Aceptan a todos los influencers.

- **Selectivas**: Solo aceptan a influencers que tengan más cantidad de seguidores que el doble del mínimo establecido por el IGBA.


Los streams se registran en cada plataforma, indicando el influencer que la realiza (verificar que sea uno registrado previamente en la plataforma, si no arrojar error), y la cantidad máxima de audiencia que obtuvo. El stream también debe conocer de que tipo fue (gaming, charla, etc), como ya se explicó, eso depende del influencer en el momento que se registra el stream.

Cada vez que un influencer realiza un stream, gana seguidores según el impacto del stream y además mejora el nivel de su característica según corresponda: si el stream es:
- Gaming, le suma 2 en habilidad gaming, 
- si es Charla le suma 2 en elocuencia y 
- si es Creativo, le suma 2 en carisma y 1 en elocuencia. 

## 🧪 Se pide probar (test) que una plataforma pueda cumplir las siguientes funcionalidades:
1. Registrar un nuevo influencer comercial en una plataforma (x) que ya sabe hacer solo streams creativos, y verificar que x tiene 1 influencer registrado.
2. Realizar un stream de adquisición para el streamer comercial de tipo gaming y verificar que ahora conoce 2 tipos de stream. 
3. Registrar un nuevo Influencer profesional en la plataforma x que haga streams de tipo gaming. Hacer 1 stream y probar que actualiza correctamente los seguidores.
4. Realizar un nuevo stream en una plataforma (x) con un influencer multifacético que elija un stream de tipo charla +13 (mas13). Probar que actualiza bien los seguidores.
5. Obtener la lista de los influencers (influencers importantes) de una plataforma abierta que califican para pasar a una plataforma selectiva.
6. Informar la cantidad total de seguidores de una plataforma.
7. El alias del influencer que haya obtenido la mayor cantidad de audiencia en un stream de una plataforma.
8. Reasignar a los 3 mejores influencers (los más importantes) de una plataforma abierta a una selectiva, si cumplen las condiciones requeridas de acuerdo a la cantidad de seguidores.
