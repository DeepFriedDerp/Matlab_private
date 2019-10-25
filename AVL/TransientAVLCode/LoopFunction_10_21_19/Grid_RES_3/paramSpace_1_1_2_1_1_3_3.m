function [aeroForces] = paramSpace_1_1_2_1_1_3_3(sailStates,airStates)

	CL = (6.300031)*sailStates.alpha + (0.317343)*sailStates.beta + (-3.237731)*sailStates.p + (34.940701)*sailStates.q + (1.494352)*sailStates.r + (0.009652)*sailStates.de;
	CD = -2.528640;
	CY = (0.270528)*sailStates.alpha + (-0.022105)*sailStates.beta + (1.011912)*sailStates.p + (-1.081939)*sailStates.q + (0.178427)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.558163)*sailStates.alpha + (-0.381826)*sailStates.beta + (-1.893381)*sailStates.p + (15.139953)*sailStates.q + (1.580602)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-16.069710)*sailStates.alpha + (-1.249426)*sailStates.beta + (12.879502)*sailStates.p + (-160.704926)*sailStates.q + (-4.869436)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.784115)*sailStates.alpha + (-0.098231)*sailStates.beta + (-2.573791)*sailStates.p + (13.696023)*sailStates.q + (-0.116258)*sailStates.r + (0.000547)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end