function [aeroForces] = paramSpace_4_2_2_2_3_2_2(sailStates,airStates)

	CL = (3.839235)*sailStates.alpha + (0.056312)*sailStates.beta + (-2.502828)*sailStates.p + (35.133209)*sailStates.q + (0.788514)*sailStates.r + (0.010683)*sailStates.de;
	CD = 0.071560;
	CY = (0.094293)*sailStates.alpha + (-0.024198)*sailStates.beta + (0.094264)*sailStates.p + (0.756269)*sailStates.q + (-0.018777)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.181596)*sailStates.alpha + (-0.059930)*sailStates.beta + (-1.192922)*sailStates.p + (10.064777)*sailStates.q + (0.509799)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-13.844966)*sailStates.alpha + (-0.195751)*sailStates.beta + (8.435382)*sailStates.p + (-135.926239)*sailStates.q + (-2.664221)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.251719)*sailStates.alpha + (0.013188)*sailStates.beta + (-0.040871)*sailStates.p + (-1.084948)*sailStates.q + (-0.046071)*sailStates.r + (-0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end