function [aeroForces] = paramSpace_3_2_4_2_2_1_3(sailStates,airStates)

	CL = (4.345663)*sailStates.alpha + (-0.042094)*sailStates.beta + (-2.942111)*sailStates.p + (37.045025)*sailStates.q + (-0.608848)*sailStates.r + (0.010951)*sailStates.de;
	CD = -0.374100;
	CY = (-0.072808)*sailStates.alpha + (-0.025023)*sailStates.beta + (-0.362298)*sailStates.p + (-0.100923)*sailStates.q + (0.023736)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.500763)*sailStates.alpha + (0.172598)*sailStates.beta + (-1.544388)*sailStates.p + (12.719687)*sailStates.q + (-0.634807)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.733592)*sailStates.alpha + (0.146455)*sailStates.beta + (10.318138)*sailStates.p + (-148.239975)*sailStates.q + (2.031552)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.041816)*sailStates.alpha + (-0.012867)*sailStates.beta + (0.924638)*sailStates.p + (-4.601553)*sailStates.q + (-0.012582)*sailStates.r + (-0.000076)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end