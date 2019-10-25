function [aeroForces] = paramSpace_1_2_2_3_2_1_2(sailStates,airStates)

	CL = (4.226108)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.547325)*sailStates.p + (37.315617)*sailStates.q + (-1.539856)*sailStates.r + (0.011163)*sailStates.de;
	CD = -0.189490;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.502613)*sailStates.p + (0.000000)*sailStates.q + (-0.088624)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.309520)*sailStates.alpha + (0.251306)*sailStates.beta + (-1.188792)*sailStates.p + (10.435473)*sailStates.q + (-1.217127)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-13.154977)*sailStates.alpha + (0.000000)*sailStates.beta + (7.931474)*sailStates.p + (-135.529190)*sailStates.q + (5.147552)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.003477)*sailStates.alpha + (0.044312)*sailStates.beta + (0.963996)*sailStates.p + (-3.713463)*sailStates.q + (-0.007673)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end