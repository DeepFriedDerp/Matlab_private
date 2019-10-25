function [aeroForces] = paramSpace_3_4_2_1_1_3_3(sailStates,airStates)

	CL = (7.283088)*sailStates.alpha + (-0.653430)*sailStates.beta + (-3.472926)*sailStates.p + (44.615051)*sailStates.q + (3.106457)*sailStates.r + (0.011881)*sailStates.de;
	CD = -2.987800;
	CY = (0.268022)*sailStates.alpha + (-0.022945)*sailStates.beta + (1.427168)*sailStates.p + (-1.915493)*sailStates.q + (-0.093474)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (2.968798)*sailStates.alpha + (-0.835408)*sailStates.beta + (-1.880510)*sailStates.p + (16.545547)*sailStates.q + (2.746705)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-14.251019)*sailStates.alpha + (2.477383)*sailStates.beta + (10.957245)*sailStates.p + (-159.650192)*sailStates.q + (-10.489819)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.398658)*sailStates.alpha + (0.036273)*sailStates.beta + (-3.039217)*sailStates.p + (14.837914)*sailStates.q + (0.027150)*sailStates.r + (0.000856)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end