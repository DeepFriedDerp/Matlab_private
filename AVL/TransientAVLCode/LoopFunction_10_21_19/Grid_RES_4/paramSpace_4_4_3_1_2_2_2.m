function [aeroForces] = paramSpace_4_4_3_1_2_2_2(sailStates,airStates)

	CL = (3.795492)*sailStates.alpha + (-0.214494)*sailStates.beta + (-2.460923)*sailStates.p + (35.037689)*sailStates.q + (0.983104)*sailStates.r + (0.010431)*sailStates.de;
	CD = 0.073860;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.227173)*sailStates.p + (0.000000)*sailStates.q + (-0.045187)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.114708)*sailStates.alpha + (-0.174241)*sailStates.beta + (-1.106872)*sailStates.p + (9.238577)*sailStates.q + (0.674441)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-13.382874)*sailStates.alpha + (0.801042)*sailStates.beta + (8.104493)*sailStates.p + (-133.820877)*sailStates.q + (-3.313102)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.086780)*sailStates.alpha + (0.025131)*sailStates.beta + (-0.326313)*sailStates.p + (0.799375)*sailStates.q + (-0.025480)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end