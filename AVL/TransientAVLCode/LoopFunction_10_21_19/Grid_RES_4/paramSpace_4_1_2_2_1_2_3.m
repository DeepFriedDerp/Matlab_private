function [aeroForces] = paramSpace_4_1_2_2_1_2_3(sailStates,airStates)

	CL = (3.882487)*sailStates.alpha + (0.242223)*sailStates.beta + (-2.826800)*sailStates.p + (38.416515)*sailStates.q + (1.323892)*sailStates.r + (0.010708)*sailStates.de;
	CD = 0.035500;
	CY = (-0.071624)*sailStates.alpha + (-0.028041)*sailStates.beta + (0.380794)*sailStates.p + (-1.057313)*sailStates.q + (-0.075707)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.470005)*sailStates.alpha + (-0.055268)*sailStates.beta + (-1.505759)*sailStates.p + (13.526457)*sailStates.q + (0.956269)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.453168)*sailStates.alpha + (-0.829647)*sailStates.beta + (9.106693)*sailStates.p + (-143.598221)*sailStates.q + (-4.406328)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.245336)*sailStates.alpha + (0.028483)*sailStates.beta + (-0.575941)*sailStates.p + (2.351629)*sailStates.q + (-0.016167)*sailStates.r + (0.000358)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end