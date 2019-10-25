function [aeroForces] = paramSpace_3_2_2_1_2_3_3(sailStates,airStates)

	CL = (6.142691)*sailStates.alpha + (0.198016)*sailStates.beta + (-3.509506)*sailStates.p + (44.787598)*sailStates.q + (2.666592)*sailStates.r + (0.012061)*sailStates.de;
	CD = -2.344550;
	CY = (0.394421)*sailStates.alpha + (-0.025048)*sailStates.beta + (1.153886)*sailStates.p + (-0.221995)*sailStates.q + (-0.075622)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.058764)*sailStates.alpha + (-0.508360)*sailStates.beta + (-1.965487)*sailStates.p + (17.396662)*sailStates.q + (2.391237)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-12.681084)*sailStates.alpha + (-0.758423)*sailStates.beta + (11.218322)*sailStates.p + (-161.490479)*sailStates.q + (-9.021378)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.457087)*sailStates.alpha + (0.038142)*sailStates.beta + (-2.473382)*sailStates.p + (10.984200)*sailStates.q + (0.013815)*sailStates.r + (0.000324)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end