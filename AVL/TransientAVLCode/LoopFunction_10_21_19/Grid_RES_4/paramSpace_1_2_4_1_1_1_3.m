function [aeroForces] = paramSpace_1_2_4_1_1_1_3(sailStates,airStates)

	CL = (5.087941)*sailStates.alpha + (-0.228340)*sailStates.beta + (-3.553036)*sailStates.p + (50.130497)*sailStates.q + (-3.139855)*sailStates.r + (0.012832)*sailStates.de;
	CD = -1.840440;
	CY = (-0.554512)*sailStates.alpha + (-0.024015)*sailStates.beta + (-1.072332)*sailStates.p + (-1.002336)*sailStates.q + (-0.213408)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.169496)*sailStates.alpha + (0.504289)*sailStates.beta + (-1.963412)*sailStates.p + (18.846567)*sailStates.q + (-2.663429)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-8.854371)*sailStates.alpha + (0.835124)*sailStates.beta + (10.038451)*sailStates.p + (-161.102386)*sailStates.q + (10.393692)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (1.832422)*sailStates.alpha + (0.114058)*sailStates.beta + (2.142594)*sailStates.p + (-7.539555)*sailStates.q + (-0.025962)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end