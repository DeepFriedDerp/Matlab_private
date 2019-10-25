function [aeroForces] = paramSpace_1_1_1_1_3_2_3(sailStates,airStates)

	CL = (3.854044)*sailStates.alpha + (-0.277782)*sailStates.beta + (-3.300408)*sailStates.p + (42.549454)*sailStates.q + (-1.623366)*sailStates.r + (0.010937)*sailStates.de;
	CD = -0.015070;
	CY = (0.083018)*sailStates.alpha + (-0.031086)*sailStates.beta + (-0.577273)*sailStates.p + (2.260755)*sailStates.q + (-0.102004)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.693340)*sailStates.alpha + (0.092685)*sailStates.beta + (-1.886053)*sailStates.p + (17.161633)*sailStates.q + (-1.242930)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-13.020357)*sailStates.alpha + (1.048215)*sailStates.beta + (10.536613)*sailStates.p + (-156.476898)*sailStates.q + (5.438861)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (0.564284)*sailStates.alpha + (0.037702)*sailStates.beta + (0.924091)*sailStates.p + (-4.472059)*sailStates.q + (0.002520)*sailStates.r + (-0.000711)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end