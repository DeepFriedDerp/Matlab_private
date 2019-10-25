function [aeroForces] = paramSpace_1_1_2_1_3_3_2(sailStates,airStates)

	CL = (4.987543)*sailStates.alpha + (0.249341)*sailStates.beta + (-2.241853)*sailStates.p + (27.379721)*sailStates.q + (0.843034)*sailStates.r + (0.008865)*sailStates.de;
	CD = -1.515180;
	CY = (0.182377)*sailStates.alpha + (-0.030256)*sailStates.beta + (0.540367)*sailStates.p + (1.664522)*sailStates.q + (0.107426)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.171111)*sailStates.alpha + (-0.279952)*sailStates.beta + (-1.116901)*sailStates.p + (8.418950)*sailStates.q + (1.045504)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-15.303641)*sailStates.alpha + (-1.001673)*sailStates.beta + (9.007133)*sailStates.p + (-131.445847)*sailStates.q + (-2.714237)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.283951)*sailStates.alpha + (-0.072369)*sailStates.beta + (-1.482639)*sailStates.p + (6.178061)*sailStates.q + (-0.042665)*sailStates.r + (-0.000337)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end