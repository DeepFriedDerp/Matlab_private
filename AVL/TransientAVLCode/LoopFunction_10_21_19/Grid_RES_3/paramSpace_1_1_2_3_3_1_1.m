function [aeroForces] = paramSpace_1_1_2_3_3_1_1(sailStates,airStates)

	CL = (4.290379)*sailStates.alpha + (-0.303243)*sailStates.beta + (-2.264529)*sailStates.p + (35.019188)*sailStates.q + (-1.570360)*sailStates.r + (0.010891)*sailStates.de;
	CD = -0.253080;
	CY = (0.103543)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.552052)*sailStates.p + (0.318252)*sailStates.q + (-0.097342)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.338609)*sailStates.alpha + (0.171932)*sailStates.beta + (-1.007735)*sailStates.p + (8.942256)*sailStates.q + (-1.250554)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-12.986169)*sailStates.alpha + (1.124350)*sailStates.beta + (6.901998)*sailStates.p + (-126.937798)*sailStates.q + (5.239511)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.285572)*sailStates.alpha + (0.048034)*sailStates.beta + (1.098199)*sailStates.p + (-4.685297)*sailStates.q + (0.004467)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end