function [aeroForces] = paramSpace_1_1_1_2_1_2_1(sailStates,airStates)

	CL = (3.739424)*sailStates.alpha + (-0.145425)*sailStates.beta + (-2.114228)*sailStates.p + (31.657618)*sailStates.q + (-0.550746)*sailStates.r + (0.010322)*sailStates.de;
	CD = 0.077420;
	CY = (-0.117269)*sailStates.alpha + (-0.021989)*sailStates.beta + (-0.052276)*sailStates.p + (-1.027327)*sailStates.q + (-0.009120)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.016385)*sailStates.alpha + (0.037756)*sailStates.beta + (-0.900657)*sailStates.p + (7.259566)*sailStates.q + (-0.364776)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-13.494419)*sailStates.alpha + (0.604551)*sailStates.beta + (7.208301)*sailStates.p + (-124.672379)*sailStates.q + (1.906215)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.195525)*sailStates.alpha + (0.006722)*sailStates.beta + (0.007012)*sailStates.p + (1.266338)*sailStates.q + (-0.035435)*sailStates.r + (0.000302)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end