%ΑΕΜ: 4116
%Ονοματεπώνυμο: Γεώργιος Δάλλας
%
%
%areas
area(anotlika,[kalamaria, kifisia, pylaia, toumba]).
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


size_per_member(mikro,Membersize):-
    Membersize < 25.

size_per_member(mesaio,Membersize):-
    Membersize >=25, 
    Membersize =<35.

size_per_member(megalo,Membersize):-
    Membersize > 35.

rooms_count(Members,Min_rooms,Max_rooms):-
    Min_rooms is ceiling(Members/2), % se kathe domatio toyl dio ara members/2 = domatia
    Max_rooms is Members-1.
is_size_enough(_MegethonIn,MembersIn,SizeIn):-
    size_per_member(_MegethosIn,MembersIn/SizeIn).

run:-
	write("Theleis mikro, mesaio h' megalo spiti?"), 
	nl,
	read(size),
	write("Se poia perioxi (anatolika/kentro/dytika)?"), 
	nl,
	read(area),
    write("Theleis kainoyrio h' palio spiti (new/old)?"),
	nl,
	read(age),
    write("Theleis Polykatoikia h' mezoneta (p/m)?"),
	nl,
	read(building_type),
    write("Posa melh exei h oikogeneia?"),
	nl,
	read(members),
    write("Exeis amaksi (y/n)?"),
	nl,
	read(car),
    write("Poio einai to megisto poso poy mporeis na diatheseis?"),
	nl,
	read(money).



