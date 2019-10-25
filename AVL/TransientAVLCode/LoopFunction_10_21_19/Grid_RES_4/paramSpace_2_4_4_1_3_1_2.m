function [aeroForces] = paramSpace_2_4_4_1_3_1_2(sailStates,airStates)

	CL = (7.571625)*sailStates.alpha + (0.615884)*sailStates.beta + (-2.588434)*sailStates.p + (37.430916)*sailStates.q + (-2.982279)*sailStates.r + (0.011447)*sailStates.de;
	CD = -2.932670;
	CY = (0.226127)*sailStates.alpha + (-0.023516)*sailStates.beta + (-1.376553)*sailStates.p + (1.693498)*sailStates.q + (-0.090045)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (2.792370)*sailStates.alpha + (0.808300)*sailStates.beta + (-1.157906)*sailStates.p + (9.838377)*sailStates.q + (-2.628530)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-15.192025)*sailStates.alpha + (-2.288386)*sailStates.beta + (8.006815)*sailStates.p + (-135.354233)*sailStates.q + (10.055440)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.690007)*sailStates.alpha + (0.035788)*sailStates.beta + (2.991235)*sailStates.p + (-14.767149)*sailStates.q + (0.028301)*sailStates.r + (-0.000746)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end