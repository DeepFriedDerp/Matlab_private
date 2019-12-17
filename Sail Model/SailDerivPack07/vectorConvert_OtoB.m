function [B_vector] = vectorConvert_OtoB(O_vector,Eul_vector)

ph = Eul_vector(1);
th = Eul_vector(2);
ps = Eul_vector(3);

	OcB = [cos(ps)*cos(th) sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps) cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps) ; sin(ps) cos(ph)*cos(ps) -cos(ps)*sin(ph) ; -cos(ps)*sin(th) cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th) cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)];
    BcO = transpose(OcB);
    
	B_vector = transpose(BcO * transpose(O_vector));

end