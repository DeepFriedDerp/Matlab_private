function [aeroForces] = paramSpace_1_2_2_1_1_2_2(sailStates,airStates)

	CL = (4.767746)*sailStates.alpha + (-0.133274)*sailStates.beta + (-2.983517)*sailStates.p + (35.941948)*sailStates.q + (0.754308)*sailStates.r + (0.010529)*sailStates.de;
	CD = -0.827200;
	CY = (0.042447)*sailStates.alpha + (-0.025821)*sailStates.beta + (0.581897)*sailStates.p + (-0.715008)*sailStates.q + (0.076558)*sailStates.r + (-0.000154)*sailStates.de;

	Cl = (1.696506)*sailStates.alpha + (-0.292756)*sailStates.beta + (-1.558567)*sailStates.p + (12.434674)*sailStates.q + (0.872662)*sailStates.r + (0.000964)*sailStates.de;
	Cm = (-15.450317)*sailStates.alpha + (0.572636)*sailStates.beta + (10.968799)*sailStates.p + (-150.764206)*sailStates.q + (-2.521126)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (-0.009758)*sailStates.alpha + (-0.029073)*sailStates.beta + (-1.464656)*sailStates.p + (7.759684)*sailStates.q + (-0.051018)*sailStates.r + (0.000319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end