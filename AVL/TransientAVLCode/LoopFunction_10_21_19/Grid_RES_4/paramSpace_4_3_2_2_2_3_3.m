function [aeroForces] = paramSpace_4_3_2_2_2_3_3(sailStates,airStates)

	CL = (4.455280)*sailStates.alpha + (-0.151722)*sailStates.beta + (-2.945208)*sailStates.p + (42.162571)*sailStates.q + (2.160451)*sailStates.r + (0.011595)*sailStates.de;
	CD = -0.492840;
	CY = (0.084639)*sailStates.alpha + (-0.024666)*sailStates.beta + (0.730925)*sailStates.p + (-0.301043)*sailStates.q + (-0.145379)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.494767)*sailStates.alpha + (-0.401260)*sailStates.beta + (-1.489957)*sailStates.p + (13.721103)*sailStates.q + (1.738402)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-12.255836)*sailStates.alpha + (0.552511)*sailStates.beta + (8.759181)*sailStates.p + (-145.703583)*sailStates.q + (-7.167988)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.447362)*sailStates.alpha + (0.069917)*sailStates.beta + (-1.403582)*sailStates.p + (5.575092)*sailStates.q + (-0.007685)*sailStates.r + (0.000223)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end