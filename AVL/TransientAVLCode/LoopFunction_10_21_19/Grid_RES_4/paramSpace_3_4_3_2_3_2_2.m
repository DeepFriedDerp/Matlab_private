function [aeroForces] = paramSpace_3_4_3_2_3_2_2(sailStates,airStates)

	CL = (3.989432)*sailStates.alpha + (-0.051984)*sailStates.beta + (-2.554747)*sailStates.p + (34.668617)*sailStates.q + (0.134356)*sailStates.r + (0.010860)*sailStates.de;
	CD = 0.027830;
	CY = (0.094865)*sailStates.alpha + (-0.025688)*sailStates.beta + (-0.041928)*sailStates.p + (0.769435)*sailStates.q + (0.002775)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.161210)*sailStates.alpha + (-0.017947)*sailStates.beta + (-1.154757)*sailStates.p + (9.094773)*sailStates.q + (0.071448)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-14.488047)*sailStates.alpha + (0.223849)*sailStates.beta + (8.776662)*sailStates.p + (-136.512222)*sailStates.q + (-0.476000)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.162497)*sailStates.alpha + (0.002206)*sailStates.beta + (0.140257)*sailStates.p + (-1.451885)*sailStates.q + (-0.008984)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end