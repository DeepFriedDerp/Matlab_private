function [aeroForces] = paramSpace_1_2_3_1_1_3_3(sailStates,airStates)

	CL = (6.431908)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.255791)*sailStates.p + (35.120041)*sailStates.q + (1.501598)*sailStates.r + (0.009900)*sailStates.de;
	CD = -2.574210;
	CY = (0.276555)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.030386)*sailStates.p + (-1.081941)*sailStates.q + (0.181582)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (2.533780)*sailStates.alpha + (-0.472026)*sailStates.beta + (-1.859538)*sailStates.p + (14.673771)*sailStates.q + (1.616617)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-16.530207)*sailStates.alpha + (-0.000000)*sailStates.beta + (12.949513)*sailStates.p + (-161.621323)*sailStates.q + (-4.927536)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (-0.753632)*sailStates.alpha + (-0.083231)*sailStates.beta + (-2.594163)*sailStates.p + (13.613144)*sailStates.q + (-0.114729)*sailStates.r + (0.000529)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end