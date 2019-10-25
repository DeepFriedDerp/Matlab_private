function [aeroForces] = paramSpace_4_1_2_3_3_2_1(sailStates,airStates)

	CL = (3.784609)*sailStates.alpha + (0.162710)*sailStates.beta + (-2.225364)*sailStates.p + (32.772011)*sailStates.q + (0.748637)*sailStates.r + (0.010400)*sailStates.de;
	CD = 0.064450;
	CY = (0.073197)*sailStates.alpha + (-0.022679)*sailStates.beta + (0.104088)*sailStates.p + (0.684401)*sailStates.q + (-0.020729)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.100182)*sailStates.alpha + (-0.031331)*sailStates.beta + (-1.004810)*sailStates.p + (8.417034)*sailStates.q + (0.484546)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-13.590231)*sailStates.alpha + (-0.565684)*sailStates.beta + (7.472037)*sailStates.p + (-127.495163)*sailStates.q + (-2.525614)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.166153)*sailStates.alpha + (0.010497)*sailStates.beta + (-0.098148)*sailStates.p + (-0.613091)*sailStates.q + (-0.037101)*sailStates.r + (-0.000180)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end