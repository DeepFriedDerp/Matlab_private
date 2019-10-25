function [aeroForces] = paramSpace_3_2_4_1_3_1_3(sailStates,airStates)

	CL = (6.819860)*sailStates.alpha + (-0.154143)*sailStates.beta + (-3.409938)*sailStates.p + (39.409363)*sailStates.q + (-2.199661)*sailStates.r + (0.010916)*sailStates.de;
	CD = -2.724200;
	CY = (-0.266282)*sailStates.alpha + (-0.024296)*sailStates.beta + (-1.189442)*sailStates.p + (1.471499)*sailStates.q + (0.078115)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (2.791285)*sailStates.alpha + (0.488494)*sailStates.beta + (-1.939110)*sailStates.p + (15.964404)*sailStates.q + (-2.078622)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-15.711027)*sailStates.alpha + (0.576619)*sailStates.beta + (12.392254)*sailStates.p + (-162.286758)*sailStates.q + (7.399920)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.058145)*sailStates.alpha + (-0.037570)*sailStates.beta + (2.759189)*sailStates.p + (-14.219121)*sailStates.q + (-0.036696)*sailStates.r + (-0.000720)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end