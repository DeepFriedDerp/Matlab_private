function [aeroForces] = paramSpace_4_4_3_1_2_3_1(sailStates,airStates)

	CL = (6.188944)*sailStates.alpha + (-0.690240)*sailStates.beta + (-1.778790)*sailStates.p + (35.704803)*sailStates.q + (2.891711)*sailStates.r + (0.011587)*sailStates.de;
	CD = -2.352060;
	CY = (-0.341710)*sailStates.alpha + (-0.026962)*sailStates.beta + (1.153857)*sailStates.p + (0.662183)*sailStates.q + (-0.229493)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (1.231867)*sailStates.alpha + (-0.773559)*sailStates.beta + (-0.461142)*sailStates.p + (4.595804)*sailStates.q + (2.481851)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-8.943125)*sailStates.alpha + (2.639352)*sailStates.beta + (3.880641)*sailStates.p + (-109.940704)*sailStates.q + (-9.571893)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (2.103610)*sailStates.alpha + (0.110207)*sailStates.beta + (-2.593878)*sailStates.p + (11.154470)*sailStates.q + (0.040434)*sailStates.r + (-0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end