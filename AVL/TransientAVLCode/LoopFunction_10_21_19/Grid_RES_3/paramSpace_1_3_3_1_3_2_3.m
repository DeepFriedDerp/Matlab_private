function [aeroForces] = paramSpace_1_3_3_1_3_2_3(sailStates,airStates)

	CL = (3.941681)*sailStates.alpha + (0.227535)*sailStates.beta + (-3.302633)*sailStates.p + (42.432652)*sailStates.q + (-1.597381)*sailStates.r + (0.011151)*sailStates.de;
	CD = -0.041470;
	CY = (0.097684)*sailStates.alpha + (-0.019694)*sailStates.beta + (-0.538123)*sailStates.p + (2.260755)*sailStates.q + (-0.094671)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.583279)*sailStates.alpha + (0.275221)*sailStates.beta + (-1.802451)*sailStates.p + (16.095583)*sailStates.q + (-1.163460)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-13.466330)*sailStates.alpha + (-0.727759)*sailStates.beta + (10.563309)*sailStates.p + (-156.476898)*sailStates.q + (5.287469)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (0.453127)*sailStates.alpha + (0.028983)*sailStates.beta + (0.880257)*sailStates.p + (-4.629699)*sailStates.q + (0.005544)*sailStates.r + (-0.000751)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end