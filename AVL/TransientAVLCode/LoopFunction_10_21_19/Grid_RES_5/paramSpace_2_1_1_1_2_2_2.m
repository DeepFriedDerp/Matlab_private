function [aeroForces] = paramSpace_2_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.006248)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.822573)*sailStates.p + (34.933578)*sailStates.q + (-0.217605)*sailStates.r + (0.009725)*sailStates.de;
	CD = -0.333900;
	CY = (0.188724)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.119736)*sailStates.p + (1.364609)*sailStates.q + (0.025304)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (1.323519)*sailStates.alpha + (-0.113919)*sailStates.beta + (-1.506550)*sailStates.p + (12.592925)*sailStates.q + (0.074713)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-14.307091)*sailStates.alpha + (0.000000)*sailStates.beta + (10.198159)*sailStates.p + (-146.890121)*sailStates.q + (0.831017)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (0.027046)*sailStates.alpha + (-0.024214)*sailStates.beta + (-0.619502)*sailStates.p + (3.025163)*sailStates.q + (-0.047731)*sailStates.r + (-0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end