function [aeroForces] = paramSpace_1_2_1_3_2_3_2(sailStates,airStates)

	CL = (3.951027)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.457278)*sailStates.p + (33.227081)*sailStates.q + (-0.232587)*sailStates.r + (0.010232)*sailStates.de;
	CD = -0.052550;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.086518)*sailStates.p + (0.000000)*sailStates.q + (0.015256)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.226614)*sailStates.alpha + (-0.043259)*sailStates.beta + (-1.160151)*sailStates.p + (9.343360)*sailStates.q + (-0.023315)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-14.505425)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.689653)*sailStates.p + (-135.529190)*sailStates.q + (0.847710)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.227676)*sailStates.alpha + (-0.007628)*sailStates.beta + (-0.387161)*sailStates.p + (2.480219)*sailStates.q + (-0.036495)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end