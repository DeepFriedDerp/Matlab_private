function [aeroForces] = paramSpace_4_3_3_1_1_1_1(sailStates,airStates)

	CL = (4.670433)*sailStates.alpha + (0.098597)*sailStates.beta + (-1.408628)*sailStates.p + (20.383429)*sailStates.q + (-1.179076)*sailStates.r + (0.008656)*sailStates.de;
	CD = -1.575860;
	CY = (0.136395)*sailStates.alpha + (-0.023875)*sailStates.beta + (-0.643961)*sailStates.p + (-1.002332)*sailStates.q + (0.128056)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.363763)*sailStates.alpha + (0.391035)*sailStates.beta + (-0.363291)*sailStates.p + (0.964917)*sailStates.q + (-1.333911)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-14.772202)*sailStates.alpha + (-0.386007)*sailStates.beta + (6.317984)*sailStates.p + (-108.591927)*sailStates.q + (3.833032)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-1.362314)*sailStates.alpha + (-0.070482)*sailStates.beta + (1.548286)*sailStates.p + (-6.188579)*sailStates.q + (-0.028207)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end