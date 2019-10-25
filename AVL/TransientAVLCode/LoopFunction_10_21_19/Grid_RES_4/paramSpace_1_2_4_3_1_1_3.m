function [aeroForces] = paramSpace_1_2_4_3_1_1_3(sailStates,airStates)

	CL = (4.057810)*sailStates.alpha + (-0.108216)*sailStates.beta + (-2.796427)*sailStates.p + (39.594326)*sailStates.q + (-1.609630)*sailStates.r + (0.011361)*sailStates.de;
	CD = -0.126450;
	CY = (-0.090201)*sailStates.alpha + (-0.024693)*sailStates.beta + (-0.456072)*sailStates.p + (-0.294838)*sailStates.q + (-0.090750)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.300480)*sailStates.alpha + (0.203680)*sailStates.beta + (-1.409986)*sailStates.p + (12.673134)*sailStates.q + (-1.237799)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-12.895314)*sailStates.alpha + (0.373139)*sailStates.beta + (8.731700)*sailStates.p + (-142.570129)*sailStates.q + (5.341086)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.320091)*sailStates.alpha + (0.046776)*sailStates.beta + (0.821534)*sailStates.p + (-2.653378)*sailStates.q + (-0.027234)*sailStates.r + (-0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end