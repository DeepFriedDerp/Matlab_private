function [aeroForces] = paramSpace_2_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.160824)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.704984)*sailStates.p + (39.263706)*sailStates.q + (-1.791166)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.153720;
	CY = (0.023749)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.582386)*sailStates.p + (0.571906)*sailStates.q + (-0.123810)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.445676)*sailStates.alpha + (0.268536)*sailStates.beta + (-1.331528)*sailStates.p + (12.128439)*sailStates.q + (-1.394946)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-12.736594)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.217152)*sailStates.p + (-139.762878)*sailStates.q + (5.956851)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (0.178866)*sailStates.alpha + (0.057079)*sailStates.beta + (1.063279)*sailStates.p + (-4.226250)*sailStates.q + (-0.010344)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end