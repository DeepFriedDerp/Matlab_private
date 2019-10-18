function [aeroForces] = paramSpace_2_2_1_2_1_2_2(sailStates,airStates)

	CL = (5.150160)*sailStates.alpha + (-3.717438)*sailStates.beta + (-3.422570)*sailStates.p + (46.879688)*sailStates.q + (2.071761)*sailStates.r + (0.010410)*sailStates.de;
	CD = -5.583830;
	CY = (1.736422)*sailStates.alpha + (-0.245792)*sailStates.beta + (0.253003)*sailStates.p + (15.363753)*sailStates.q + (-0.024603)*sailStates.r + (0.002923)*sailStates.de;

	Cl = (-5.064661)*sailStates.alpha + (-1.172052)*sailStates.beta + (-1.654642)*sailStates.p + (13.983878)*sailStates.q + (2.310505)*sailStates.r + (0.001198)*sailStates.de;
	Cm = (4.505106)*sailStates.alpha + (16.807032)*sailStates.beta + (10.714095)*sailStates.p + (-150.805283)*sailStates.q + (-7.360138)*sailStates.r + (-0.055215)*sailStates.de;
	Cn = (-1.756755)*sailStates.alpha + (0.344047)*sailStates.beta + (-0.778041)*sailStates.p + (-9.191274)*sailStates.q + (-0.194566)*sailStates.r + (-0.003833)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end