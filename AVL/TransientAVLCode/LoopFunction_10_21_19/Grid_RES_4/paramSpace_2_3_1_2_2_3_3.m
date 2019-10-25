function [aeroForces] = paramSpace_2_3_1_2_2_3_3(sailStates,airStates)

	CL = (4.345663)*sailStates.alpha + (-0.042094)*sailStates.beta + (-2.942111)*sailStates.p + (37.045025)*sailStates.q + (0.608849)*sailStates.r + (0.010951)*sailStates.de;
	CD = -0.374100;
	CY = (0.072808)*sailStates.alpha + (-0.024930)*sailStates.beta + (0.362298)*sailStates.p + (0.100923)*sailStates.q + (0.023736)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.454877)*sailStates.alpha + (-0.197692)*sailStates.beta + (-1.511742)*sailStates.p + (12.315811)*sailStates.q + (0.636989)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.733590)*sailStates.alpha + (0.146455)*sailStates.beta + (10.318137)*sailStates.p + (-148.239990)*sailStates.q + (-2.031552)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.028595)*sailStates.alpha + (-0.011403)*sailStates.beta + (-0.922498)*sailStates.p + (4.575082)*sailStates.q + (-0.012439)*sailStates.r + (0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end