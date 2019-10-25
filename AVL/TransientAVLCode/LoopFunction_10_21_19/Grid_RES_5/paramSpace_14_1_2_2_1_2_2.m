function [aeroForces] = paramSpace_14_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.196130)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.705808)*sailStates.p + (39.211792)*sailStates.q + (1.782348)*sailStates.r + (0.011146)*sailStates.de;
	CD = -0.159580;
	CY = (-0.025082)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.567945)*sailStates.p + (-0.571906)*sailStates.q + (-0.120700)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.444850)*sailStates.alpha + (-0.261312)*sailStates.beta + (-1.331921)*sailStates.p + (12.126081)*sailStates.q + (1.371329)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-12.949291)*sailStates.alpha + (0.000000)*sailStates.beta + (8.227883)*sailStates.p + (-139.762878)*sailStates.q + (-5.906363)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (-0.173433)*sailStates.alpha + (0.055543)*sailStates.beta + (-1.041439)*sailStates.p + (4.215156)*sailStates.q + (-0.010002)*sailStates.r + (0.000259)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end