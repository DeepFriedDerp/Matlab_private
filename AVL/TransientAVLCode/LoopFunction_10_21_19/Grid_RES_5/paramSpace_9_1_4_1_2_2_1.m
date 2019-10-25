function [aeroForces] = paramSpace_9_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.506948)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.087939)*sailStates.p + (31.647184)*sailStates.q + (1.178433)*sailStates.r + (0.011004)*sailStates.de;
	CD = -0.596740;
	CY = (0.027015)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.499797)*sailStates.p + (1.046668)*sailStates.q + (-0.017343)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (0.918906)*sailStates.alpha + (-0.292266)*sailStates.beta + (-0.804048)*sailStates.p + (6.125806)*sailStates.q + (1.117858)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.768376)*sailStates.alpha + (0.000000)*sailStates.beta + (7.009526)*sailStates.p + (-123.745377)*sailStates.q + (-4.046950)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (0.508521)*sailStates.alpha + (0.010206)*sailStates.beta + (-1.114877)*sailStates.p + (4.116547)*sailStates.q + (0.000390)*sailStates.r + (-0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end