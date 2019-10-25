function [aeroForces] = paramSpace_3_2_1_3_3_1_3(sailStates,airStates)

	CL = (4.284100)*sailStates.alpha + (-0.042932)*sailStates.beta + (-2.815288)*sailStates.p + (36.244041)*sailStates.q + (-0.428711)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.206520;
	CY = (0.017854)*sailStates.alpha + (-0.024868)*sailStates.beta + (-0.325266)*sailStates.p + (0.432841)*sailStates.q + (0.021273)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.476006)*sailStates.alpha + (0.135753)*sailStates.beta + (-1.434879)*sailStates.p + (11.745228)*sailStates.q + (-0.495482)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-15.082389)*sailStates.alpha + (0.199479)*sailStates.beta + (9.832760)*sailStates.p + (-144.575424)*sailStates.q + (1.481262)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.096597)*sailStates.alpha + (-0.010118)*sailStates.beta + (0.782593)*sailStates.p + (-4.044921)*sailStates.q + (-0.012900)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end