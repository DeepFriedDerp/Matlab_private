function [aeroForces] = paramSpace_1_4_4_1_3_1_3(sailStates,airStates)

	CL = (7.517687)*sailStates.alpha + (0.800539)*sailStates.beta + (-3.435854)*sailStates.p + (50.411106)*sailStates.q + (-3.985035)*sailStates.r + (0.012620)*sailStates.de;
	CD = -3.080510;
	CY = (-0.243246)*sailStates.alpha + (-0.018106)*sailStates.beta + (-1.599955)*sailStates.p + (2.326709)*sailStates.q + (-0.318001)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (3.156728)*sailStates.alpha + (0.967259)*sailStates.beta + (-1.830433)*sailStates.p + (18.152212)*sailStates.q + (-3.345774)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-12.176083)*sailStates.alpha + (-2.886120)*sailStates.beta + (8.835671)*sailStates.p + (-155.326050)*sailStates.q + (13.123695)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (1.800173)*sailStates.alpha + (0.127088)*sailStates.beta + (3.269269)*sailStates.p + (-15.266637)*sailStates.q + (0.056627)*sailStates.r + (-0.000999)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end