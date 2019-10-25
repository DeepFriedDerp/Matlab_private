function [aeroForces] = paramSpace_1_2_1_1_3_2_1(sailStates,airStates)

	CL = (3.803803)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.598318)*sailStates.p + (28.302452)*sailStates.q + (-1.013962)*sailStates.r + (0.010257)*sailStates.de;
	CD = -0.019050;
	CY = (0.288040)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.390058)*sailStates.p + (1.081941)*sailStates.q + (-0.068881)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.775396)*sailStates.alpha + (0.151880)*sailStates.beta + (-0.441980)*sailStates.p + (3.238442)*sailStates.q + (-0.737040)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-12.704874)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.998276)*sailStates.p + (-109.437057)*sailStates.q + (3.398934)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-0.759244)*sailStates.alpha + (0.026781)*sailStates.beta + (0.790389)*sailStates.p + (-4.260281)*sailStates.q + (0.023099)*sailStates.r + (-0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end