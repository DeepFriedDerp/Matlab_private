function [aeroForces] = paramSpace_3_1_1_2_1_3_2(sailStates,airStates)

	CL = (4.781118)*sailStates.alpha + (0.299810)*sailStates.beta + (-2.566082)*sailStates.p + (35.928337)*sailStates.q + (1.528015)*sailStates.r + (0.011158)*sailStates.de;
	CD = -0.589610;
	CY = (-0.098813)*sailStates.alpha + (-0.025363)*sailStates.beta + (0.654003)*sailStates.p + (-0.769434)*sailStates.q + (-0.042784)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.666989)*sailStates.alpha + (-0.193573)*sailStates.beta + (-1.251388)*sailStates.p + (10.647559)*sailStates.q + (1.302771)*sailStates.r + (0.000451)*sailStates.de;
	Cm = (-14.444227)*sailStates.alpha + (-1.064615)*sailStates.beta + (8.382381)*sailStates.p + (-135.788696)*sailStates.q + (-5.138129)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.218716)*sailStates.alpha + (0.021026)*sailStates.beta + (-1.391089)*sailStates.p + (6.765985)*sailStates.q + (0.010809)*sailStates.r + (0.000352)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end