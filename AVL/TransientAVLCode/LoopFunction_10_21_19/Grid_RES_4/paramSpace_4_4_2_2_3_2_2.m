function [aeroForces] = paramSpace_4_4_2_2_3_2_2(sailStates,airStates)

	CL = (3.780822)*sailStates.alpha + (-0.167022)*sailStates.beta + (-2.483951)*sailStates.p + (34.864876)*sailStates.q + (0.781039)*sailStates.r + (0.010521)*sailStates.de;
	CD = 0.070830;
	CY = (0.093560)*sailStates.alpha + (-0.027114)*sailStates.beta + (0.092632)*sailStates.p + (0.756270)*sailStates.q + (-0.018453)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.070955)*sailStates.alpha + (-0.124183)*sailStates.beta + (-1.121102)*sailStates.p + (9.196963)*sailStates.q + (0.492237)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-13.635835)*sailStates.alpha + (0.580630)*sailStates.beta + (8.373150)*sailStates.p + (-134.899979)*sailStates.q + (-2.639184)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.216624)*sailStates.alpha + (0.020983)*sailStates.beta + (-0.051131)*sailStates.p + (-0.932464)*sailStates.q + (-0.043378)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end