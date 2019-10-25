function [aeroForces] = paramSpace_1_2_1_2_2_1_2(sailStates,airStates)

	CL = (4.519574)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.570850)*sailStates.p + (38.506741)*sailStates.q + (-1.911629)*sailStates.r + (0.011283)*sailStates.de;
	CD = -0.487440;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.688387)*sailStates.p + (0.000000)*sailStates.q + (-0.121381)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.403093)*sailStates.alpha + (0.344194)*sailStates.beta + (-1.196092)*sailStates.p + (10.737299)*sailStates.q + (-1.583427)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-12.478921)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.709517)*sailStates.p + (-135.529190)*sailStates.q + (6.406337)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.043011)*sailStates.alpha + (0.060691)*sailStates.beta + (1.370455)*sailStates.p + (-5.425199)*sailStates.q + (-0.000618)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end