%ΑΕΜ: 4116
%Ονοματεπώνυμο: Γεώργιος Δάλλας
%
%
%areas
area(anatolika,[kalamaria, kifisia, pylaia, toumba]).
area(kentro,[ano_poli, agios_pavlos, sykies]).
area(dytika,[stavroupoli, evosmos, menemeni]).


%homes
home(1, 95, 3, old, p, n, kalamaria, 190000).
home(2, 105, 2, old, m, y, pylaia, 189000).
home(3, 111, 3, new, p, y, toumba, 177600).
home(4, 84, 2, old, p, n, ano_poli, 142800).
home(5, 97, 2, new, m, n, agios_pavlos, 145500).
home(6, 93, 2, new, p, n, sykies, 120900).
home(7, 120, 3, new, m, n, stavroupoli, 144000).
home(8, 130, 4, new, p, y, evosmos, 130000).
home(9, 92, 2, old, p, n, menemeni, 128800).
home(10, 115, 3, new, p, y, pylaia, 210000).
home(11, 140, 2, new, p, y, kifisia, 270000).

%size of m^2 per human
size_per_member(mikro,Membersize):-
    Membersize < 25.

size_per_member(mesaio,Membersize):-
    Membersize >=25, 
    Membersize =<35.

size_per_member(megalo,Membersize):-
    Membersize > 35.
%finding and returniong Min and Max rooms allowed for inputed members
rooms_count(Members,Min_rooms,Max_rooms):-
    Min_rooms is ceiling(Members/2), % se kathe domatio toyl dio ara members/2 = domatia
    Max_rooms is Members-1.
%using the size per member and by calculating the m^2 of every member it finds if size is enough
is_size_enough(_MegethonIn,MembersIn,SizeIn):-
    MemberSize is SizeIn / MembersIn,
    size_per_member(_MegethosIn, MemberSize).
%finding if rooms are in [Min_rooms,Max_Rooms]. Members in params is used to calc the min max values
are_rooms_enough(Rooms,Members):-
    rooms_count(Members,Min_rooms,Max_rooms),
    Rooms =< Max_rooms,
    Rooms >= Min_rooms.
%is true when a location is in an area f.e. (kentro, ano_poli)
is_in_area(Area, Location) :-
    area(Area, Locations),
    member(Location, Locations).
%pring case that the list of houses is empty
print_if_empty([]):-
    write("Den yparxei spiti poy na symfwnei me tis prodiagrafes."),nl.
print_if_empty([_|_]). %skipping the case in other case by having it true.

print_homes([]). %recursive way of printing every element in the list of houses. This is the ending case
print_homes([(ID, Size, Rooms, Age_In, Building_type_In, Car_In, Area, Price) | Rest]) :- %and this is the rest
    write("Ena katallilo spiti gia sena einai to No "), write(ID), nl,
    write("Embado: "), write(Size), nl,
    write("Domatia: "), write(Rooms), nl,
    write("Hlikia: "), write(Age_In), nl,
    write("Typos: "), write(Building_type_In), nl,
    write("Parking: "), write(Car_In), nl,
    write("Synoikia: "), write(Area), nl,
    write("Timh: "), write(Price), nl,nl,
    print_homes(Rest). %recursion 

% compare by prices used for sorting later
compare_by_price(Home, (_, _, _, _, _, _, _, Price1), (_, _, _, _, _, _, _, Price2)) :-
    compare(Home, Price1, Price2).

run:- %main 
	write("Theleis mikro, mesaio h' megalo spiti?"),  %ola ta user input
	nl,
	read(Size_In),
	write("Se poia perioxi (anatolika/kentro/dytika)?"), 
	nl,
	read(Area_In),
    write("Theleis kainoyrio h' palio spiti (new/old)?"),
	nl,
	read(Age_In),
    write("Theleis Polykatoikia h' mezoneta (p/m)?"),
	nl,
	read(Building_type_In),
    write("Posa melh exei h oikogeneia?"),
	nl,
	read(Members_In),
    write("Exeis amaksi (y/n)?"),
	nl,
	read(Car_In),
    write("Poio einai to megisto poso poy mporeis na diatheseis?"),
	nl,
	read(Money_In),
    findall((ID, Size, Rooms, Age_In, Building_type_In, Car_In, Area, Price), %vriskei ola ta home me kapoies times katefthian inputed apo to read (oses exoun _In)
        (home(ID, Size, Rooms, Age_In, Building_type_In, Car_In, Area, Price),
            is_in_area(Area_In,Area),%poy plhroun tis parakatw proypotheseis. Analithikan pio panw ti einai to kathena
            Money_In>=Price,
            are_rooms_enough(Rooms,Members_In),
            is_size_enough(Size_In,Members_In,Size)),
         
        X), %epistrefei mia lista X me ta apotelesmata
    predsort(compare_by_price, X, Sorted), % Ταξινόμηση με βάση την τιμή, %taksinomish me afksousa timh
    print_if_empty(Sorted), %kalei ta prints 
    print_homes(Sorted).