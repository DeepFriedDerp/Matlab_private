function [aeroForces] = paramSpace_1_2_3_1_2_1_3(sailStates,airStates)

	CL = (6.210913)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.515636)*sailStates.p + (49.485752)*sailStates.q + (-3.417991)*sailStates.r + (0.012738)*sailStates.de;
	CD = -2.400460;
	CY = (-0.406014)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.308854)*sailStates.p + (0.589404)*sailStates.q + (-0.230730)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (2.075226)*sailStates.alpha + (0.630911)*sailStates.beta + (-1.928216)*sailStates.p + (18.479412)*sailStates.q + (-2.908531)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-10.811705)*sailStates.alpha + (0.000000)*sailStates.beta + (9.818516)*sailStates.p + (-159.507309)*sailStates.q + (11.339797)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (1.791271)*sailStates.alpha + (0.111247)*sailStates.beta + (2.665692)*sailStates.p + (-11.320962)*sailStates.q + (0.016895)*sailStates.r + (-0.000465)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end