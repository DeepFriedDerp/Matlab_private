function [aeroForces] = paramSpace_2_3_3_2_3_1_3(sailStates,airStates)

	CL = (4.780981)*sailStates.alpha + (0.109977)*sailStates.beta + (-2.987592)*sailStates.p + (39.469433)*sailStates.q + (-1.591731)*sailStates.r + (0.011501)*sailStates.de;
	CD = -0.610150;
	CY = (-0.001804)*sailStates.alpha + (-0.024697)*sailStates.beta + (-0.685636)*sailStates.p + (0.870360)*sailStates.q + (-0.044908)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.724594)*sailStates.alpha + (0.342332)*sailStates.beta + (-1.523848)*sailStates.p + (12.965440)*sailStates.q + (-1.366944)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.386752)*sailStates.alpha + (-0.409791)*sailStates.beta + (9.788569)*sailStates.p + (-147.878265)*sailStates.q + (5.371402)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.178867)*sailStates.alpha + (0.019441)*sailStates.beta + (1.429826)*sailStates.p + (-6.858998)*sailStates.q + (0.010605)*sailStates.r + (-0.000388)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end