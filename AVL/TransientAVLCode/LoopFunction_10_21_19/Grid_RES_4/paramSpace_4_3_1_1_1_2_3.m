function [aeroForces] = paramSpace_4_3_1_1_1_2_3(sailStates,airStates)

	CL = (3.984513)*sailStates.alpha + (-0.093643)*sailStates.beta + (-3.284682)*sailStates.p + (42.746960)*sailStates.q + (1.740716)*sailStates.r + (0.011208)*sailStates.de;
	CD = -0.037240;
	CY = (-0.098397)*sailStates.alpha + (-0.022744)*sailStates.beta + (0.569455)*sailStates.p + (-2.326708)*sailStates.q + (-0.113022)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.640039)*sailStates.alpha + (-0.232416)*sailStates.beta + (-1.816947)*sailStates.p + (16.528809)*sailStates.q + (1.268334)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-13.513084)*sailStates.alpha + (0.298217)*sailStates.beta + (10.370519)*sailStates.p + (-156.352325)*sailStates.q + (-5.745369)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.522549)*sailStates.alpha + (0.037422)*sailStates.beta + (-0.916975)*sailStates.p + (4.664579)*sailStates.q + (0.001320)*sailStates.r + (0.000779)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end