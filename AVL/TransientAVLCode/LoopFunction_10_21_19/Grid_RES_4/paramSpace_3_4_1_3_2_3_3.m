function [aeroForces] = paramSpace_3_4_1_3_2_3_3(sailStates,airStates)

	CL = (4.200847)*sailStates.alpha + (-0.193352)*sailStates.beta + (-2.824793)*sailStates.p + (37.567356)*sailStates.q + (1.003937)*sailStates.r + (0.011203)*sailStates.de;
	CD = -0.175510;
	CY = (0.031892)*sailStates.alpha + (-0.024737)*sailStates.beta + (0.371532)*sailStates.p + (-0.065300)*sailStates.q + (-0.024345)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.327433)*sailStates.alpha + (-0.246772)*sailStates.beta + (-1.368157)*sailStates.p + (11.285572)*sailStates.q + (0.826181)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.158563)*sailStates.alpha + (0.658086)*sailStates.beta + (9.418955)*sailStates.p + (-143.297119)*sailStates.q + (-3.368689)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.064193)*sailStates.alpha + (0.011344)*sailStates.beta + (-0.771200)*sailStates.p + (3.415833)*sailStates.q + (0.002009)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end