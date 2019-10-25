function [aeroForces] = paramSpace_1_1_2_3_3_3_1(sailStates,airStates)

	CL = (3.912251)*sailStates.alpha + (-0.030755)*sailStates.beta + (-2.175305)*sailStates.p + (30.872652)*sailStates.q + (-0.251840)*sailStates.r + (0.010075)*sailStates.de;
	CD = -0.060430;
	CY = (0.032285)*sailStates.alpha + (-0.025633)*sailStates.beta + (0.056542)*sailStates.p + (0.318252)*sailStates.q + (0.009970)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.124071)*sailStates.alpha + (-0.053854)*sailStates.beta + (-0.979509)*sailStates.p + (7.847488)*sailStates.q + (-0.025269)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-14.414936)*sailStates.alpha + (0.076462)*sailStates.beta + (7.671774)*sailStates.p + (-126.937798)*sailStates.q + (0.873892)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (0.180871)*sailStates.alpha + (-0.009968)*sailStates.beta + (-0.282184)*sailStates.p + (1.523438)*sailStates.q + (-0.023758)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end