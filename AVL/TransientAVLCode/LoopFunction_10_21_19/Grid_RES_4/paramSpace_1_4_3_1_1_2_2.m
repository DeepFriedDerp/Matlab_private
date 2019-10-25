function [aeroForces] = paramSpace_1_4_3_1_1_2_2(sailStates,airStates)

	CL = (3.789958)*sailStates.alpha + (0.134678)*sailStates.beta + (-2.510757)*sailStates.p + (34.715248)*sailStates.q + (-0.548498)*sailStates.r + (0.010527)*sailStates.de;
	CD = 0.050180;
	CY = (-0.200677)*sailStates.alpha + (-0.029911)*sailStates.beta + (0.051708)*sailStates.p + (-1.664521)*sailStates.q + (0.010226)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.080457)*sailStates.alpha + (0.073239)*sailStates.beta + (-1.137784)*sailStates.p + (9.149640)*sailStates.q + (-0.301370)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-13.838140)*sailStates.alpha + (-0.474019)*sailStates.beta + (8.684214)*sailStates.p + (-136.195908)*sailStates.q + (1.888097)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.367270)*sailStates.alpha + (0.017746)*sailStates.beta + (-0.253373)*sailStates.p + (2.999005)*sailStates.q + (-0.065273)*sailStates.r + (0.000479)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end