function [aeroForces] = paramSpace_4_3_3_2_3_3_2(sailStates,airStates)

	CL = (4.252465)*sailStates.alpha + (-0.142620)*sailStates.beta + (-2.579295)*sailStates.p + (38.784168)*sailStates.q + (1.819889)*sailStates.r + (0.011309)*sailStates.de;
	CD = -0.364040;
	CY = (0.102036)*sailStates.alpha + (-0.025807)*sailStates.beta + (0.577436)*sailStates.p + (0.756268)*sailStates.q + (-0.114832)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.158279)*sailStates.alpha + (-0.357707)*sailStates.beta + (-1.185451)*sailStates.p + (10.621119)*sailStates.q + (1.475526)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-11.977998)*sailStates.alpha + (0.543325)*sailStates.beta + (7.756833)*sailStates.p + (-135.926239)*sailStates.q + (-6.075517)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.080928)*sailStates.alpha + (0.063967)*sailStates.beta + (-1.135382)*sailStates.p + (3.786633)*sailStates.q + (-0.020839)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end