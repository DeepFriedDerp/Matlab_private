function [aeroForces] = paramSpace_1_2_3_1_2_2_3(sailStates,airStates)

	CL = (3.617520)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.363662)*sailStates.p + (42.425457)*sailStates.q + (-1.173216)*sailStates.r + (0.011313)*sailStates.de;
	CD = 0.067470;
	CY = (-0.026952)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.272600)*sailStates.p + (0.589408)*sailStates.q + (-0.048011)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.339294)*sailStates.alpha + (0.112784)*sailStates.beta + (-1.880159)*sailStates.p + (16.615351)*sailStates.q + (-0.822220)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-13.042222)*sailStates.alpha + (0.000000)*sailStates.beta + (11.129217)*sailStates.p + (-159.507309)*sailStates.q + (3.906443)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (0.442789)*sailStates.alpha + (0.019887)*sailStates.beta + (0.315326)*sailStates.p + (-0.749339)*sailStates.q + (-0.031248)*sailStates.r + (-0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end