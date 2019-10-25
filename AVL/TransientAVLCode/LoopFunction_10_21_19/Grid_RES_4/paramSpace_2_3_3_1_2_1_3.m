function [aeroForces] = paramSpace_2_3_3_1_2_1_3(sailStates,airStates)

	CL = (6.142692)*sailStates.alpha + (0.198016)*sailStates.beta + (-3.509506)*sailStates.p + (44.787598)*sailStates.q + (-2.666592)*sailStates.r + (0.012061)*sailStates.de;
	CD = -2.344550;
	CY = (-0.394421)*sailStates.alpha + (-0.024905)*sailStates.beta + (-1.153886)*sailStates.p + (0.221995)*sailStates.q + (-0.075622)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (2.023612)*sailStates.alpha + (0.626368)*sailStates.beta + (-1.932838)*sailStates.p + (16.992777)*sailStates.q + (-2.389112)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-12.681083)*sailStates.alpha + (-0.758423)*sailStates.beta + (11.218323)*sailStates.p + (-161.490479)*sailStates.q + (9.021379)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (1.405021)*sailStates.alpha + (0.036232)*sailStates.beta + (2.475522)*sailStates.p + (-11.010671)*sailStates.q + (0.013954)*sailStates.r + (-0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end