function [aeroForces] = paramSpace_4_4_2_3_3_2_2(sailStates,airStates)

	CL = (3.793415)*sailStates.alpha + (-0.176517)*sailStates.beta + (-2.476081)*sailStates.p + (34.908791)*sailStates.q + (0.849310)*sailStates.r + (0.010520)*sailStates.de;
	CD = 0.070440;
	CY = (0.061025)*sailStates.alpha + (-0.026293)*sailStates.beta + (0.135008)*sailStates.p + (0.489618)*sailStates.q + (-0.026872)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.081170)*sailStates.alpha + (-0.139140)*sailStates.beta + (-1.116205)*sailStates.p + (9.210858)*sailStates.q + (0.548273)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-13.604907)*sailStates.alpha + (0.611930)*sailStates.beta + (8.281826)*sailStates.p + (-134.519470)*sailStates.q + (-2.859694)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.171250)*sailStates.alpha + (0.021933)*sailStates.beta + (-0.140530)*sailStates.p + (-0.325754)*sailStates.q + (-0.036950)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end