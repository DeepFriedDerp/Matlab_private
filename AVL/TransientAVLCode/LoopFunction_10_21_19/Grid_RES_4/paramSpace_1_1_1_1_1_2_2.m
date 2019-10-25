function [aeroForces] = paramSpace_1_1_1_1_1_2_2(sailStates,airStates)

	CL = (3.700747)*sailStates.alpha + (-0.175452)*sailStates.beta + (-2.509322)*sailStates.p + (34.811878)*sailStates.q + (-0.565497)*sailStates.r + (0.010353)*sailStates.de;
	CD = 0.082140;
	CY = (-0.200637)*sailStates.alpha + (-0.018970)*sailStates.beta + (0.022909)*sailStates.p + (-1.664521)*sailStates.q + (0.004736)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.200177)*sailStates.alpha + (0.015675)*sailStates.beta + (-1.231466)*sailStates.p + (10.341934)*sailStates.q + (-0.366857)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-13.421596)*sailStates.alpha + (0.737764)*sailStates.beta + (8.664578)*sailStates.p + (-136.195908)*sailStates.q + (1.986804)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.408085)*sailStates.alpha + (-0.001006)*sailStates.beta + (-0.228695)*sailStates.p + (3.213125)*sailStates.q + (-0.070277)*sailStates.r + (0.000499)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end