function [O_vector] = vectorConvert_StoO(S_vector,Eul_vector,alpha)

ph = Eul_vector(1);
th = Eul_vector(2);
ps = Eul_vector(3);

	OcS = [- sin(alpha)*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) - cos(alpha)*cos(ps)*cos(th) sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps) cos(ps)*sin(alpha)*cos(th) - cos(alpha)*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) ; cos(ps)*sin(alpha)*sin(ph) - cos(alpha)*sin(ps) cos(ph)*cos(ps) sin(alpha)*sin(ps) + cos(alpha)*cos(ps)*sin(ph) ; cos(alpha)*cos(ps)*sin(th) - sin(alpha)*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th) - cos(alpha)*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - cos(ps)*sin(alpha)*sin(th)];

	O_vector = transpose(OcS * transpose(S_vector));

end