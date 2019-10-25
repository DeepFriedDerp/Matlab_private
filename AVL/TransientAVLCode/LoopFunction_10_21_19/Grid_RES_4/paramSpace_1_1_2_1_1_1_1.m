function [aeroForces] = paramSpace_1_1_2_1_1_1_1(sailStates,airStates)

	CL = (5.262449)*sailStates.alpha + (-0.630983)*sailStates.beta + (-1.827893)*sailStates.p + (35.430679)*sailStates.q + (-2.465661)*sailStates.r + (0.011593)*sailStates.de;
	CD = -1.814790;
	CY = (0.010597)*sailStates.alpha + (-0.017140)*sailStates.beta + (-0.889377)*sailStates.p + (-2.326711)*sailStates.q + (-0.176825)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.602021)*sailStates.alpha + (0.380916)*sailStates.beta + (-0.586085)*sailStates.p + (5.696950)*sailStates.q + (-2.150913)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-8.253860)*sailStates.alpha + (2.444202)*sailStates.beta + (4.450544)*sailStates.p + (-112.315697)*sailStates.q + (8.196239)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-1.314394)*sailStates.alpha + (0.106273)*sailStates.beta + (2.017120)*sailStates.p + (-7.130882)*sailStates.q + (-0.003608)*sailStates.r + (0.000518)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end