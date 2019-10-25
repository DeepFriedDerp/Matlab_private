function [aeroForces] = paramSpace_1_2_3_2_2_1_2(sailStates,airStates)

	CL = (4.581873)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.572598)*sailStates.p + (38.390774)*sailStates.q + (-1.888534)*sailStates.r + (0.011494)*sailStates.de;
	CD = -0.482280;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.649463)*sailStates.p + (-0.000000)*sailStates.q + (-0.114518)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.403929)*sailStates.alpha + (0.324731)*sailStates.beta + (-1.196931)*sailStates.p + (10.731990)*sailStates.q + (-1.520429)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-12.961164)*sailStates.alpha + (0.000000)*sailStates.beta + (7.732714)*sailStates.p + (-135.529190)*sailStates.q + (6.274781)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.046629)*sailStates.alpha + (0.057259)*sailStates.beta + (1.312055)*sailStates.p + (-5.395092)*sailStates.q + (0.000280)*sailStates.r + (-0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end