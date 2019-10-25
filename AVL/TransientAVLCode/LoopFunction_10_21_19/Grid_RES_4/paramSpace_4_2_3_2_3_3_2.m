function [aeroForces] = paramSpace_4_2_3_2_3_3_2(sailStates,airStates)

	CL = (4.252465)*sailStates.alpha + (0.142620)*sailStates.beta + (-2.579295)*sailStates.p + (38.784168)*sailStates.q + (1.819889)*sailStates.r + (0.011309)*sailStates.de;
	CD = -0.364040;
	CY = (0.102036)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.577436)*sailStates.p + (0.756268)*sailStates.q + (-0.114832)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.200776)*sailStates.alpha + (-0.278769)*sailStates.beta + (-1.216989)*sailStates.p + (11.018089)*sailStates.q + (1.481813)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-11.977998)*sailStates.alpha + (-0.543324)*sailStates.beta + (7.756832)*sailStates.p + (-135.926239)*sailStates.q + (-6.075519)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.118290)*sailStates.alpha + (0.062636)*sailStates.beta + (-1.129109)*sailStates.p + (3.707671)*sailStates.q + (-0.022089)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end