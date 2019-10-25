function [aeroForces] = paramSpace_1_4_2_1_3_3_2(sailStates,airStates)

	CL = (4.987543)*sailStates.alpha + (-0.249341)*sailStates.beta + (-2.241853)*sailStates.p + (27.379721)*sailStates.q + (0.843035)*sailStates.r + (0.008865)*sailStates.de;
	CD = -1.515180;
	CY = (0.182377)*sailStates.alpha + (-0.019316)*sailStates.beta + (0.540367)*sailStates.p + (1.664522)*sailStates.q + (0.107426)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.006032)*sailStates.alpha + (-0.390805)*sailStates.beta + (-1.022528)*sailStates.p + (7.231070)*sailStates.q + (1.064318)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-15.303641)*sailStates.alpha + (1.001673)*sailStates.beta + (9.007133)*sailStates.p + (-131.445847)*sailStates.q + (-2.714237)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.342382)*sailStates.alpha + (-0.061053)*sailStates.beta + (-1.463867)*sailStates.p + (5.941777)*sailStates.q + (-0.038922)*sailStates.r + (-0.000337)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end