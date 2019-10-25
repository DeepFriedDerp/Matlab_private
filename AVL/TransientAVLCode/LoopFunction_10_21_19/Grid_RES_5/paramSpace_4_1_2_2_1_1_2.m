function [aeroForces] = paramSpace_4_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.064849)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.778784)*sailStates.p + (38.224030)*sailStates.q + (-1.206720)*sailStates.r + (0.011228)*sailStates.de;
	CD = -0.081670;
	CY = (-0.071337)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.372181)*sailStates.p + (-0.291853)*sailStates.q + (-0.052296)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.301942)*sailStates.alpha + (0.197796)*sailStates.beta + (-1.375964)*sailStates.p + (11.822187)*sailStates.q + (-0.963503)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-13.520985)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.037847)*sailStates.p + (-142.523422)*sailStates.q + (4.074048)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (0.202983)*sailStates.alpha + (0.027798)*sailStates.beta + (0.676282)*sailStates.p + (-2.178002)*sailStates.q + (-0.013241)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end