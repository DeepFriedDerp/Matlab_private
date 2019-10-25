function [aeroForces] = paramSpace_4_1_4_1_2_3_1(sailStates,airStates)

	CL = (6.170535)*sailStates.alpha + (0.710759)*sailStates.beta + (-1.778295)*sailStates.p + (35.752312)*sailStates.q + (2.898965)*sailStates.r + (0.011503)*sailStates.de;
	CD = -2.361160;
	CY = (-0.347088)*sailStates.alpha + (-0.022472)*sailStates.beta + (1.167992)*sailStates.p + (0.662189)*sailStates.q + (-0.232257)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (1.380810)*sailStates.alpha + (-0.426009)*sailStates.beta + (-0.555255)*sailStates.p + (5.785931)*sailStates.q + (2.523198)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-8.744846)*sailStates.alpha + (-2.768656)*sailStates.beta + (3.872674)*sailStates.p + (-109.940704)*sailStates.q + (-9.611947)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (1.924309)*sailStates.alpha + (0.128407)*sailStates.beta + (-2.596450)*sailStates.p + (10.929480)*sailStates.q + (0.036076)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end