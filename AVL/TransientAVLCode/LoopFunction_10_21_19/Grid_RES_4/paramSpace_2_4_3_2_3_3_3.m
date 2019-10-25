function [aeroForces] = paramSpace_2_4_3_2_3_3_3(sailStates,airStates)

	CL = (4.206194)*sailStates.alpha + (-0.141821)*sailStates.beta + (-2.915392)*sailStates.p + (36.788048)*sailStates.q + (0.429012)*sailStates.r + (0.010844)*sailStates.de;
	CD = -0.318210;
	CY = (0.150859)*sailStates.alpha + (-0.023949)*sailStates.beta + (0.268575)*sailStates.p + (0.870359)*sailStates.q + (0.017634)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.275417)*sailStates.alpha + (-0.195566)*sailStates.beta + (-1.465470)*sailStates.p + (11.850926)*sailStates.q + (0.525180)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.443520)*sailStates.alpha + (0.621377)*sailStates.beta + (10.170302)*sailStates.p + (-146.834106)*sailStates.q + (-1.478120)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.096565)*sailStates.alpha + (-0.010098)*sailStates.beta + (-0.710163)*sailStates.p + (2.845712)*sailStates.q + (-0.005921)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end