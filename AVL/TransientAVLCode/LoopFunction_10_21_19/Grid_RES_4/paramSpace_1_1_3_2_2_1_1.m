function [aeroForces] = paramSpace_1_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.427010)*sailStates.alpha + (-0.409845)*sailStates.beta + (-2.151348)*sailStates.p + (35.289299)*sailStates.q + (-1.841788)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.483010;
	CY = (0.068755)*sailStates.alpha + (-0.023859)*sailStates.beta + (-0.633718)*sailStates.p + (-0.301043)*sailStates.q + (-0.126065)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.226045)*sailStates.alpha + (0.209057)*sailStates.beta + (-0.907975)*sailStates.p + (8.312541)*sailStates.q + (-1.490945)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-11.947886)*sailStates.alpha + (1.505247)*sailStates.beta + (6.193831)*sailStates.p + (-122.964470)*sailStates.q + (6.110285)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.430932)*sailStates.alpha + (0.066561)*sailStates.beta + (1.315823)*sailStates.p + (-5.254524)*sailStates.q + (0.001088)*sailStates.r + (-0.000017)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end