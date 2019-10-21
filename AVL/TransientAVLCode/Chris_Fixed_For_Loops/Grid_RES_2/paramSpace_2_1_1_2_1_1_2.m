function [aeroForces] = paramSpace_2_1_1_2_1_1_2(sailStates,airStates)

	CL = (5.091798)*sailStates.alpha + (-2.787840)*sailStates.beta + (-6.582694)*sailStates.p + (76.869591)*sailStates.q + (5.858569)*sailStates.r + (0.014638)*sailStates.de;
	CD = -9.347940;
	CY = (3.951744)*sailStates.alpha + (-0.026711)*sailStates.beta + (2.369828)*sailStates.p + (0.406550)*sailStates.q + (-0.311850)*sailStates.r + (0.000090)*sailStates.de;

	Cl = (-2.048853)*sailStates.alpha + (-2.015279)*sailStates.beta + (-4.308998)*sailStates.p + (40.843067)*sailStates.q + (5.309125)*sailStates.r + (0.005448)*sailStates.de;
	Cm = (14.442090)*sailStates.alpha + (11.232503)*sailStates.beta + (19.336815)*sailStates.p + (-240.493683)*sailStates.q + (-19.862789)*sailStates.r + (-0.079535)*sailStates.de;
	Cn = (-15.163839)*sailStates.alpha + (0.151371)*sailStates.beta + (-4.766460)*sailStates.p + (18.424259)*sailStates.q + (-0.001248)*sailStates.r + (0.000454)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end