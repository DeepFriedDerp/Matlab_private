function [O_vector] = vectorConvert_WtoO(W_vector,Eul_vector,alpha,beta)

ph = Eul_vector(1);
th = Eul_vector(2);
ps = Eul_vector(3);

	OcW = [sin(beta)*(sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps)) - cos(beta)*(sin(alpha)*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) + cos(alpha)*cos(ps)*cos(th)) sin(beta)*(sin(alpha)*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) + cos(alpha)*cos(ps)*cos(th)) + cos(beta)*(sin(ph)*sin(th) - cos(ph)*cos(th)*sin(ps)) cos(ps)*sin(alpha)*cos(th) - cos(alpha)*(cos(ph)*sin(th) + cos(th)*sin(ph)*sin(ps)) ; cos(ph)*cos(ps)*sin(beta) - cos(beta)*(cos(alpha)*sin(ps) - cos(ps)*sin(alpha)*sin(ph)) sin(beta)*(cos(alpha)*sin(ps) - cos(ps)*sin(alpha)*sin(ph)) + cos(beta)*cos(ph)*cos(ps) sin(alpha)*sin(ps) + cos(alpha)*cos(ps)*sin(ph) ; sin(beta)*(cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th)) - cos(beta)*(sin(alpha)*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - cos(alpha)*cos(ps)*sin(th)) sin(beta)*(sin(alpha)*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - cos(alpha)*cos(ps)*sin(th)) + cos(beta)*(cos(th)*sin(ph) + cos(ph)*sin(ps)*sin(th)) - cos(alpha)*(cos(ph)*cos(th) - sin(ph)*sin(ps)*sin(th)) - cos(ps)*sin(alpha)*sin(th)];

	O_vector = transpose(OcW * transpose(W_vector));

end