function [aeroForces] = paramSpace_1_1_3_2_3_1_3(sailStates,airStates)

	CL = (4.765366)*sailStates.alpha + (-0.388760)*sailStates.beta + (-2.926643)*sailStates.p + (41.556171)*sailStates.q + (-2.216311)*sailStates.r + (0.011541)*sailStates.de;
	CD = -0.635040;
	CY = (0.002816)*sailStates.alpha + (-0.027165)*sailStates.beta + (-0.812061)*sailStates.p + (1.027330)*sailStates.q + (-0.143091)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.819198)*sailStates.alpha + (0.230378)*sailStates.beta + (-1.539378)*sailStates.p + (14.290350)*sailStates.q + (-1.797464)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.013376)*sailStates.alpha + (1.374433)*sailStates.beta + (8.718375)*sailStates.p + (-144.553253)*sailStates.q + (7.349570)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.415131)*sailStates.alpha + (0.067066)*sailStates.beta + (1.589104)*sailStates.p + (-7.090508)*sailStates.q + (0.010782)*sailStates.r + (-0.000454)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end