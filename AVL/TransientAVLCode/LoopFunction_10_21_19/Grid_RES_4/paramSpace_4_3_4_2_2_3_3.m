function [aeroForces] = paramSpace_4_3_4_2_2_3_3(sailStates,airStates)

	CL = (4.393591)*sailStates.alpha + (-0.165782)*sailStates.beta + (-2.943547)*sailStates.p + (42.260483)*sailStates.q + (2.178744)*sailStates.r + (0.011416)*sailStates.de;
	CD = -0.487310;
	CY = (0.089674)*sailStates.alpha + (-0.024625)*sailStates.beta + (0.760054)*sailStates.p + (-0.301046)*sailStates.q + (-0.151216)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.492452)*sailStates.alpha + (-0.416570)*sailStates.beta + (-1.489194)*sailStates.p + (13.725518)*sailStates.q + (1.786008)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-11.852177)*sailStates.alpha + (0.641879)*sailStates.beta + (8.738204)*sailStates.p + (-145.703583)*sailStates.q + (-7.273445)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.464489)*sailStates.alpha + (0.072817)*sailStates.beta + (-1.447552)*sailStates.p + (5.597292)*sailStates.q + (-0.008675)*sailStates.r + (0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end