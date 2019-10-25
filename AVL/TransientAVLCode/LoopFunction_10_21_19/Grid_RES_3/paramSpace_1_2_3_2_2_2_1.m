function [aeroForces] = paramSpace_1_2_3_2_2_2_1(sailStates,airStates)

	CL = (3.915433)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.112570)*sailStates.p + (31.892435)*sailStates.q + (-0.730817)*sailStates.r + (0.010670)*sailStates.de;
	CD = 0.044990;
	CY = (-0.010425)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.136235)*sailStates.p + (-0.267956)*sailStates.q + (-0.024047)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (0.991594)*sailStates.alpha + (0.078808)*sailStates.beta + (-0.854574)*sailStates.p + (6.825880)*sailStates.q + (-0.459616)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-14.036910)*sailStates.alpha + (0.000000)*sailStates.beta + (7.054456)*sailStates.p + (-124.628265)*sailStates.q + (2.440944)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.002462)*sailStates.alpha + (0.013896)*sailStates.beta + (0.212517)*sailStates.p + (-0.523442)*sailStates.q + (-0.017190)*sailStates.r + (0.000052)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end