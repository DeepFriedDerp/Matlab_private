function [aeroForces] = paramSpace_2_4_2_1_2_1_1(sailStates,airStates)

	CL = (6.135569)*sailStates.alpha + (0.581916)*sailStates.beta + (-1.720324)*sailStates.p + (30.202362)*sailStates.q + (-2.440612)*sailStates.r + (0.010993)*sailStates.de;
	CD = -2.330190;
	CY = (0.373643)*sailStates.alpha + (-0.025046)*sailStates.beta + (-1.096443)*sailStates.p + (-0.221994)*sailStates.q + (-0.071857)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.157369)*sailStates.alpha + (0.706941)*sailStates.beta + (-0.445585)*sailStates.p + (3.103897)*sailStates.q + (-2.219424)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-12.285491)*sailStates.alpha + (-2.296314)*sailStates.beta + (5.241547)*sailStates.p + (-111.854546)*sailStates.q + (8.285534)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.107229)*sailStates.alpha + (0.032849)*sailStates.beta + (2.446429)*sailStates.p + (-10.928486)*sailStates.q + (0.016721)*sailStates.r + (-0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end