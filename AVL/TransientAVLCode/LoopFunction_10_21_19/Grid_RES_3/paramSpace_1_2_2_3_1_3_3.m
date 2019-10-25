function [aeroForces] = paramSpace_1_2_2_3_1_3_3(sailStates,airStates)

	CL = (4.018801)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.723973)*sailStates.p + (35.227253)*sailStates.q + (-0.184877)*sailStates.r + (0.010465)*sailStates.de;
	CD = -0.115260;
	CY = (-0.020816)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.156761)*sailStates.p + (-0.318253)*sailStates.q + (0.027641)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.350854)*sailStates.alpha + (-0.065685)*sailStates.beta + (-1.375997)*sailStates.p + (11.297493)*sailStates.q + (0.038209)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-14.687118)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.674499)*sailStates.p + (-143.204193)*sailStates.q + (0.669926)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.231269)*sailStates.alpha + (-0.011582)*sailStates.beta + (-0.559903)*sailStates.p + (3.564755)*sailStates.q + (-0.049207)*sailStates.r + (0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end