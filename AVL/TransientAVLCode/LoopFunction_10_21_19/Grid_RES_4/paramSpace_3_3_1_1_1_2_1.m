function [aeroForces] = paramSpace_3_3_1_1_1_2_1(sailStates,airStates)

	CL = (3.930624)*sailStates.alpha + (-0.027781)*sailStates.beta + (-1.665157)*sailStates.p + (27.870228)*sailStates.q + (0.648755)*sailStates.r + (0.010691)*sailStates.de;
	CD = -0.036730;
	CY = (-0.293643)*sailStates.alpha + (-0.024607)*sailStates.beta + (0.291434)*sailStates.p + (-1.471502)*sailStates.q + (-0.018946)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.700151)*sailStates.alpha + (-0.099538)*sailStates.beta + (-0.458537)*sailStates.p + (2.906675)*sailStates.q + (0.459408)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.954953)*sailStates.alpha + (0.068742)*sailStates.beta + (5.612888)*sailStates.p + (-112.102478)*sailStates.q + (-2.155905)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.649696)*sailStates.alpha + (0.005166)*sailStates.beta + (-0.606260)*sailStates.p + (3.971214)*sailStates.q + (0.011097)*sailStates.r + (0.000466)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end