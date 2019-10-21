function [aeroForces] = paramSpace_1_2_1_2_2_2_1(sailStates,airStates)

	CL = (5.986016)*sailStates.alpha + (-0.835649)*sailStates.beta + (-6.138978)*sailStates.p + (55.615963)*sailStates.q + (2.686872)*sailStates.r + (0.010918)*sailStates.de;
	CD = -9.058280;
	CY = (2.960655)*sailStates.alpha + (-0.017318)*sailStates.beta + (1.502742)*sailStates.p + (4.368784)*sailStates.q + (0.198459)*sailStates.r + (0.000994)*sailStates.de;

	Cl = (-1.482310)*sailStates.alpha + (-1.075024)*sailStates.beta + (-4.236596)*sailStates.p + (36.345413)*sailStates.q + (2.891146)*sailStates.r + (0.005601)*sailStates.de;
	Cm = (8.662631)*sailStates.alpha + (3.517977)*sailStates.beta + (23.089090)*sailStates.p + (-241.647659)*sailStates.q + (-9.107169)*sailStates.r + (-0.082863)*sailStates.de;
	Cn = (-11.169423)*sailStates.alpha + (-0.108045)*sailStates.beta + (-4.047355)*sailStates.p + (17.285433)*sailStates.q + (-0.080594)*sailStates.r + (-0.000769)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end