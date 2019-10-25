function [aeroForces] = paramSpace_4_2_4_2_2_3_3(sailStates,airStates)

	CL = (4.393591)*sailStates.alpha + (0.165782)*sailStates.beta + (-2.943547)*sailStates.p + (42.260487)*sailStates.q + (2.178744)*sailStates.r + (0.011416)*sailStates.de;
	CD = -0.487310;
	CY = (0.089674)*sailStates.alpha + (-0.025328)*sailStates.beta + (0.760054)*sailStates.p + (-0.301046)*sailStates.q + (-0.151216)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.529246)*sailStates.alpha + (-0.318407)*sailStates.beta + (-1.520727)*sailStates.p + (14.122485)*sailStates.q + (1.792323)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-11.852177)*sailStates.alpha + (-0.641879)*sailStates.beta + (8.738202)*sailStates.p + (-145.703583)*sailStates.q + (-7.273444)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.505188)*sailStates.alpha + (0.073379)*sailStates.beta + (-1.441280)*sailStates.p + (5.518331)*sailStates.q + (-0.009931)*sailStates.r + (0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end